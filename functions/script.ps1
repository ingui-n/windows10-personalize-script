Get-Content ..\.env | ForEach-Object {
    $line = $_.Trim()
    if (-not $line.StartsWith("#"))
    {
        $name, $value = $line.Split('=')
        Set-Content "env:\$name" $value
    }
}

if ($env:MUTE_VOLUME -eq "1")
{
    # sets volume to 0
    (New-Object -ComObject WScript.Shell).SendKeys([char]173)
}

if ($env:HIDE_SEARCH -eq "1")
{
    # removes search icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force
}

if ($env:HIDE_TASKS -eq "1")
{
    # removes tasks icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced -Name ShowTaskViewButton -Type DWord -Value 0
}

if ($env:HIDE_PEOPLE -eq "1")
{
    # removes people icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People -Name PeopleBand -Value 0 -Type DWord
}

if ($env:HIDE_MEET -eq "1")
{
    # removes meet now icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer -Name HideSCAMeetNow -Value 1
}

if ($env:SHOW_WINDOW_CONTENT_ON_DRAG -eq "1")
{
    # enmables show window contents while dragging
    Set-ItemProperty -Path HKCU:\\Control Panel\\Desktop -Name DragFullWindows -Value 1
}

#renaming device
if ($env:RENAME_MACHINE -eq "1" -and $env:DEVICE_NAME -ne "")
{
    Rename-Computer -NewName $env:DEVICE_NAME
}

# restarts explorer.exe
Stop-Process -Name "explorer" -Force

if ($env:DISABLE_ONE_FINGER_TRIGGER -eq "1")
{
    # disbales trigger for one finger prompt
    $MethodDefinition = @'
[StructLayout(LayoutKind.Sequential)]
public struct STICKYKEYS
{
    public uint cbSize;
    public int dwFlags;
}
[DllImport("user32.dll")]
public static extern int SystemParametersInfo(int uiAction, int uiParam, out STICKYKEYS pvParam, int fWinIni);
'@
    $get = 0x003A
    $set = 0x003B
    $WinApiVariable = Add-Type -MemberDefinition $MethodDefinition -Name 'Win32' -NameSpace '' -PassThru
    $startupStickyKeys = New-Object -TypeName 'Win32+STICKYKEYS'
    $startupStickyKeys.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys)
    [Win32]::SystemParametersInfo($get,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0)
    Write-Host "Current:"
    $startupStickyKeys.dwFlags
    Write-host "Set current flag to disabled (506)"
    $startupStickyKeys.dwFlags = 506
    [Win32]::SystemParametersInfo($set,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0)
}

if ($env:CHANGE_WINDOWS_LANG -eq "1" -and $env:LOCALE -ne "")
{
    # set language to czech
    $LanguageList = Get-WinUserLanguageList
    $LanguageList.Add("$env:LOCALE")

    if ($env:CHANGE_WINDOWS_KEYBOARD -eq "1")
    {
        # set keyboard to czech
        Set-WinUserLanguageList -LanguageList $LanguageList -Force
    }
}

if ($env:CHANGE_WINDOWS_LOCALE -eq "1" -and $env:LOCALE -ne "" -and $env:LOCALE_NUMBER -ne "")
{
    # switch loacale
    Set-WinSystemLocale -SystemLocale "$env:LOCALE"
    Set-WinHomeLocation -GeoId $env:LOCALE_NUMBER
}

# isnatlls Chocolatey
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# adds wifi entry
#Copy-Item "..\\software\\wifi-entry.xml" -Destination "custom-wifi-entry.xml";
#(Get-Content custom-wifi-entry.xml) | ForEach-Object { $_ -replace '{SSID}', $env:WIFI_SSID } | Set-Content custom-wifi-entry.xml;
#(Get-Content custom-wifi-entry.xml) | ForEach-Object { $_ -replace '{PASSWORD}', $env:WIFI_KEY } | Set-Content custom-wifi-entry.xml;
#netsh wlan add profile filename = "custom-wifi-entry.xml";
#netsh wlan connect name = "$env:WIFI_SSID"


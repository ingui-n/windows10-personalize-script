function isChocolateyInstalled()
{
    return Test-Path "C:\ProgramData\chocolatey\choco.exe"
}

function installChocolatey()
{
    if (!(isChocolateyInstalled))
    {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }
}

function isDirectXInstalled()
{
    $directxVersion = Get-ItemProperty -Path 'HKLM:\Software\Microsoft\DirectX' -Name Version
    return $directxVersion.Version -eq "4.09.0000.0904" -or $directxVersion.Version -eq "4.09.00.0904"
}

function insertVariables()
{
    Get-Content .env | ForEach-Object {
        $line = $_.Trim()
        if (-not $line.StartsWith("#"))
        {
            $name, $value = $line.Split('=')
            Set-Content "env:\$name" $value
        }
    }
}

insertVariables

# variables:
$isOnline = Test-Connection -ComputerName "1.1.1.1" -Count 1 -Quiet
$tempPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path + "\windows10-personalize-temp\"

if (!(Test-Path -Path $tempPath))
{
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

if ($env:ADD_WIFI_ENTRY -eq "1" -and $null -ne $env:WIFI_SSID -and $null -ne $env:WIFI_KEY)
{
    $filePath = $tempPath + $env:WIFI_SSID
    $templatePath = "software\wifi-entry.xml"

    Copy-Item $templatePath -Destination "$filePath"
    (Get-Content $filePath) | ForEach-Object { $_ -replace '{SSID}', $env:WIFI_SSID } | Set-Content $filePath
    (Get-Content $filePath) | ForEach-Object { $_ -replace '{PASSWORD}', $env:WIFI_KEY } | Set-Content $filePath
    netsh wlan add profile filename = "$filePath" | Out-Null
    netsh wlan connect name = "$env:WIFI_SSID" | Out-Null
}

$isOnline = Test-Connection -ComputerName "1.1.1.1" -Count 1 -Quiet

if (!($isOnline))
{
    Write-Output "No internet connection!"
}

# Install Visual C++ if is not installed
$vcx86 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Microsoft Visual C++*" } | Select-Object DisplayName, DisplayVersion
$vcx64 = Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Microsoft Visual C++*" } | Select-Object DisplayName, DisplayVersion

if ($isOnline)
{
    # Check if either version is installed
    if ($vcx86 -eq $false -and $vcx64 -eq $false)
    {
        $filePath = $tempPath + "VisualCppRedist_AIO_x86_x64.exe"
        Invoke-WebRequest -Uri "https://github.com/abbodi1406/vcredist/releases/download/v0.73.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "${filePath}"
        $command = "$filePath /ai /gm2"
        Invoke-Expression $command
    }
}

# installs directX if is not installed
if (!(isDirectXInstalled))
{
    software\dxwebsetup.exe /Q
}

# installs chocolatey
if ($env:INSTALL_CHOCOLATEY -eq "1" -and $isOnline)
{
    installChocolatey
}

# synchonizes time
#w32tm /resync /force

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
    # enables show window contents while dragging
    Set-ItemProperty -Path HKCU:\\Control Panel\\Desktop -Name DragFullWindows -Value 1
}

#renaming device
if ($env:RENAME_MACHINE -eq "1" -and $null -ne $env:DEVICE_NAME)
{
    Rename-Computer -NewName $env:DEVICE_NAME
}

# restarts explorer.exe
Stop-Process -Name "explorer" -Force

if ($env:DISABLE_ONE_FINGER_TRIGGER -eq "1")
{
    # disbales trigger for one finger prompt
    $get = 0x003A
    $set = 0x003B
    $startupStickyKeys = New-Object -TypeName 'Win32+STICKYKEYS'
    $startupStickyKeys.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys)
    [Win32]::SystemParametersInfo($get,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0)
    Write-Host "Current:"
    $startupStickyKeys.dwFlags
    Write-host "Set current flag to disabled (506)"
    $startupStickyKeys.dwFlags = 506
    [Win32]::SystemParametersInfo($set,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0)
}

if ($env:CHANGE_WINDOWS_LANG -eq "1" -and $null -ne $env:LOCALE)
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

if ($env:CHANGE_WINDOWS_LOCALE -eq "1" -and $null -ne $env:LOCALE -and $null -ne $env:LOCALE_NUMBER)
{
    # switch loacale
    Set-WinSystemLocale -SystemLocale "$env:LOCALE"
    Set-WinHomeLocation -GeoId $env:LOCALE_NUMBER
}

if ($env:INSTALL_OPERA_PROFILE -eq "1")
{
    $destination = "$env:APPDATA\Opera Software"
    $zipFile = "software\Opera Stable.zip"

    if (!(Test-Path -Path $destination))
    {
        New-Item -ItemType Directory -Path $destination
    }

    Expand-Archive -Path $zipFile -DestinationPath $destination
}

if ($env:INSTALL_DRIVER_BOOSTER -eq "1")
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    choco install driverbooster -y
}

if ($env:INSTALL_CHOCOLATEY_APPS -eq "1")
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    choco install $env:CHOCO_APPS -y
}

Remove-Item -Path $tempPath -Recurse

# synchonizes time
#w32tm /resync /force

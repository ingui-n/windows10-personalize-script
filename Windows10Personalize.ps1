$DEFAULT_LOCALE = "cs-CZ"
$DEFAULT_LOCALE_NUMBER = "75"
$DEFAULT_TIMEZONE = "Central Europe Standard Time"
$DEFAULT_CHOCO_APPS = "opera vlc steam netlimiter deskpins anydesk.install lightshot discord eartrumpet translucenttb"
$WINDOWS_KEY = "W269N-WFGWX-YVC9B-4J6C9-T83GX"

function Show-InputBox
{
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $screenHeight = [System.Windows.Forms.Screen]::AllScreens.WorkingArea.Height

    $form = New-Object System.Windows.Forms.Form
    $form.text = "Windows 10 Personalize"
    $form.width = 350
    $form.height = ($screenHeight - 50)
    $form.AutoScroll = $true
    $form.minimumSize = New-Object System.Drawing.Size(350, 350)
    $form.maximumSize = New-Object System.Drawing.Size(350, 885)
    $form.MaximizeBox = $false

    $form.Font = New-Object System.Drawing.Font("Arial", 10)

    # rename PC
    $checkboxRenamePC = new-object System.Windows.Forms.checkbox
    $checkboxRenamePC.Location = new-object System.Drawing.Size(10, 10)
    $checkboxRenamePC.Text = "Rename PC"
    $checkboxRenamePC.Add_CheckStateChanged({ $textBoxPCName.enabled = $checkboxRenamePC.Checked })
    $form.Controls.Add($checkboxRenamePC)

    $labelPCName = New-Object System.Windows.Forms.Label
    $labelPCName.Location = New-Object System.Drawing.Point(10, 40)
    $labelPCName.Text = "New PC name:"
    $form.Controls.Add($labelPCName)

    $textBoxPCName = New-Object System.Windows.Forms.TextBox
    $textBoxPCName.Location = New-Object System.Drawing.Point(150, (40 - 3))
    $textBoxPCName.Text = ""
    $textBoxPCName.width = 150
    $textBoxPCName.enabled = $false
    $form.Controls.Add($textBoxPCName)


    # add Wi-Fi entry
    $checkboxAddWiFi = new-object System.Windows.Forms.checkbox
    $checkboxAddWiFi.Location = new-object System.Drawing.Size(10, 70)
    $checkboxAddWiFi.Text = "Add WiFi entry"
    $checkboxAddWiFi.width = 120
    $checkboxAddWiFi.Add_CheckStateChanged({
        $textWiFiSSID.enabled = $checkboxAddWiFi.Checked
        $textWiFiKey.enabled = $checkboxAddWiFi.Checked
    })
    $form.Controls.Add($checkboxAddWiFi)

    $labelWiFiSSID = New-Object System.Windows.Forms.Label
    $labelWiFiSSID.Location = New-Object System.Drawing.Point(10, 100)
    $labelWiFiSSID.Text = "WiFi SSID:"
    $form.Controls.Add($labelWiFiSSID)

    $textWiFiSSID = New-Object System.Windows.Forms.TextBox
    $textWiFiSSID.Location = New-Object System.Drawing.Point(150, (100 - 3))
    $textWiFiSSID.Text = ""
    $textWiFiSSID.width = 150
    $textWiFiSSID.enabled = $false
    $form.Controls.Add($textWiFiSSID)

    $labelWiFiKey = New-Object System.Windows.Forms.Label
    $labelWiFiKey.Location = New-Object System.Drawing.Point(10, 130)
    $labelWiFiKey.Text = "WiFi Key:"
    $form.Controls.Add($labelWiFiKey)

    $textWiFiKey = New-Object System.Windows.Forms.TextBox
    $textWiFiKey.Location = New-Object System.Drawing.Point(150, (130 - 3))
    $textWiFiKey.Text = ""
    $textWiFiKey.width = 150
    $textWiFiKey.enabled = $false
    $form.Controls.Add($textWiFiKey)


    # language
    $checkboxSwitchLanguage = new-object System.Windows.Forms.checkbox
    $checkboxSwitchLanguage.Location = new-object System.Drawing.Size(10, 160)
    $checkboxSwitchLanguage.Text = "Change Windows language"
    $checkboxSwitchLanguage.width = 300
    $checkboxSwitchLanguage.Add_CheckStateChanged({
        $textWindowsLocale.enabled = $checkboxSwitchLanguage.Checked
        $textWindowsLocaleNumber.enabled = $checkboxSwitchLanguage.Checked
        $textTimezone.enabled = $checkboxSwitchLanguage.Checked
    })
    $form.Controls.Add($checkboxSwitchLanguage)

    $labelWindowsLocale = New-Object System.Windows.Forms.Label
    $labelWindowsLocale.Location = New-Object System.Drawing.Point(10, 190)
    $labelWindowsLocale.width = 130
    $labelWindowsLocale.Text = "Windows locale:"
    $form.Controls.Add($labelWindowsLocale)

    $textWindowsLocale = New-Object System.Windows.Forms.TextBox
    $textWindowsLocale.Location = New-Object System.Drawing.Point(150, (190 - 3))
    $textWindowsLocale.Text = $DEFAULT_LOCALE
    $textWindowsLocale.width = 150
    $textWindowsLocale.enabled = $false
    $form.Controls.Add($textWindowsLocale)

    $labelWindowsLocaleNumber = New-Object System.Windows.Forms.Label
    $labelWindowsLocaleNumber.Location = New-Object System.Drawing.Point(10, 220)
    $labelWindowsLocaleNumber.width = 140
    $labelWindowsLocaleNumber.Text = "Windows locale num:"
    $form.Controls.Add($labelWindowsLocaleNumber)

    $textWindowsLocaleNumber = New-Object System.Windows.Forms.TextBox
    $textWindowsLocaleNumber.Location = New-Object System.Drawing.Point(150, (220 - 3))
    $textWindowsLocaleNumber.Text = $DEFAULT_LOCALE_NUMBER
    $textWindowsLocaleNumber.width = 150
    $textWindowsLocaleNumber.enabled = $false
    $form.Controls.Add($textWindowsLocaleNumber)

    $labelTimezone = New-Object System.Windows.Forms.Label
    $labelTimezone.Location = New-Object System.Drawing.Point(10, 250)
    $labelTimezone.width = 90
    $labelTimezone.Text = "Time zone:"
    $form.Controls.Add($labelTimezone)

    $textTimezone = New-Object System.Windows.Forms.TextBox
    $textTimezone.Location = New-Object System.Drawing.Point(100, (250 - 3))
    $textTimezone.Text = $DEFAULT_TIMEZONE
    $textTimezone.width = 200
    $textTimezone.enabled = $false
    $form.Controls.Add($textTimezone)


    # activate Windows
    $checkboxActivateWindows = new-object System.Windows.Forms.checkbox
    $checkboxActivateWindows.Location = new-object System.Drawing.Size(10, 280)
    $checkboxActivateWindows.Text = "Activate Windows"
    $checkboxActivateWindows.width = 300
    $checkboxActivateWindows.Add_CheckStateChanged({
        $textBoxActivateWindows.enabled = $checkboxActivateWindows.Checked
    })
    $form.Controls.Add($checkboxActivateWindows)

    $labelActivateWindows = New-Object System.Windows.Forms.Label
    $labelActivateWindows.Location = New-Object System.Drawing.Point(10, 310)
    $labelActivateWindows.Text = "Key:"
    $labelActivateWindows.width = 35
    $form.Controls.Add($labelActivateWindows)

    $textBoxActivateWindows = New-Object System.Windows.Forms.TextBox
    $textBoxActivateWindows.Location = New-Object System.Drawing.Point(50, (310 - 3))
    $textBoxActivateWindows.Text = $WINDOWS_KEY
    $textBoxActivateWindows.width = 250
    $textBoxActivateWindows.enabled = $false
    $form.Controls.Add($textBoxActivateWindows)


    # windows main panel
    $checkboxHideSearch = new-object System.Windows.Forms.checkbox
    $checkboxHideSearch.Location = new-object System.Drawing.Size(10, 340)
    $checkboxHideSearch.Text = "Hide search icon from main panel"
    $checkboxHideSearch.width = 300
    $form.Controls.Add($checkboxHideSearch)

    $checkboxHideTasks = new-object System.Windows.Forms.checkbox
    $checkboxHideTasks.Location = new-object System.Drawing.Size(10, 370)
    $checkboxHideTasks.Text = "Hide tasks icon from main panel"
    $checkboxHideTasks.width = 300
    $form.Controls.Add($checkboxHideTasks)

    $checkboxHidePeople = new-object System.Windows.Forms.checkbox
    $checkboxHidePeople.Location = new-object System.Drawing.Size(10, 400)
    $checkboxHidePeople.Text = "Hide people icon from main panel"
    $checkboxHidePeople.width = 300
    $form.Controls.Add($checkboxHidePeople)

    $checkboxHideMeet = new-object System.Windows.Forms.checkbox
    $checkboxHideMeet.Location = new-object System.Drawing.Size(10, 430)
    $checkboxHideMeet.Text = "Hide meet icon from main panel"
    $checkboxHideMeet.width = 300
    $form.Controls.Add($checkboxHideMeet)

    $checkboxHideNews = new-object System.Windows.Forms.checkbox
    $checkboxHideNews.Location = new-object System.Drawing.Size(10, 460)
    $checkboxHideNews.Text = "Hide news icon from main panel"
    $checkboxHideNews.width = 300
    $form.Controls.Add($checkboxHideNews)

    $checkboxShowDragContent = new-object System.Windows.Forms.checkbox
    $checkboxShowDragContent.Location = new-object System.Drawing.Size(10, 490)
    $checkboxShowDragContent.Text = "Show window content on drag"
    $checkboxShowDragContent.width = 300
    $form.Controls.Add($checkboxShowDragContent)

    $checkboxDisableOneFinger = new-object System.Windows.Forms.checkbox
    $checkboxDisableOneFinger.Location = new-object System.Drawing.Size(10, 520)
    $checkboxDisableOneFinger.Text = "Disable one finger function trigger"
    $checkboxDisableOneFinger.width = 300
    $form.Controls.Add($checkboxDisableOneFinger)

    $checkboxSetThisPCDefault = new-object System.Windows.Forms.checkbox
    $checkboxSetThisPCDefault.Location = new-object System.Drawing.Size(10, 550)
    $checkboxSetThisPCDefault.Text = "Set default folder to This PC"
    $checkboxSetThisPCDefault.width = 300
    $form.Controls.Add($checkboxSetThisPCDefault)


    # Opera profile
    $checkboxInstallOperaProfile = new-object System.Windows.Forms.checkbox
    $checkboxInstallOperaProfile.Location = new-object System.Drawing.Size(10, 580)
    $checkboxInstallOperaProfile.Text = "Install Opera clean profile"
    $checkboxInstallOperaProfile.width = 300
    $form.Controls.Add($checkboxInstallOperaProfile)


    # Chocolatey
    $checkboxInstallChocolatey = new-object System.Windows.Forms.checkbox
    $checkboxInstallChocolatey.Location = new-object System.Drawing.Size(10, 610)
    $checkboxInstallChocolatey.Text = "Install Chocolatey"
    $checkboxInstallChocolatey.width = 300
    $form.Controls.Add($checkboxInstallChocolatey)

    $checkboxInstallDriverBooster = new-object System.Windows.Forms.checkbox
    $checkboxInstallDriverBooster.Location = new-object System.Drawing.Size(10, 640)
    $checkboxInstallDriverBooster.Text = "Install Iobit Driver Booster"
    $checkboxInstallDriverBooster.width = 300
    $form.Controls.Add($checkboxInstallDriverBooster)

    $checkboxChocolateyApps = new-object System.Windows.Forms.checkbox
    $checkboxChocolateyApps.Location = new-object System.Drawing.Size(10, 670)
    $checkboxChocolateyApps.Text = "Install Chocolatey apps:"
    $checkboxChocolateyApps.width = 300
    $checkboxChocolateyApps.Add_CheckStateChanged({
        $textChocolateyApps.enabled = $checkboxChocolateyApps.Checked
    })
    $form.Controls.Add($checkboxChocolateyApps)

    $textChocolateyApps = New-Object System.Windows.Forms.TextBox
    $textChocolateyApps.Location = New-Object System.Drawing.Point(10, 700)
    $textChocolateyApps.Size = New-Object System.Drawing.Size(300, 100)
    $textChocolateyApps.Text = $DEFAULT_CHOCO_APPS
    $textChocolateyApps.enabled = $false
    $textChocolateyApps.Multiline = $true
    $textChocolateyApps.Scrollbars = "Vertical"
    $textChocolateyApps.Font = New-Object System.Drawing.Font("Arial", 11)
    $form.Controls.Add($textChocolateyApps)


    $buttonSubmit = New-Object System.Windows.Forms.Button
    $buttonSubmit.Location = New-Object System.Drawing.Point(230, 810)
    $buttonSubmit.Size = New-Object System.Drawing.Size(75, 23)
    $buttonSubmit.Text = "Run"
    $buttonSubmit.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.Controls.Add($buttonSubmit)
    $form.AcceptButton = $buttonSubmit

    $padding = New-Object System.Windows.Forms.Label
    $padding.Location = New-Object System.Drawing.Point(10, 820)
    $form.Controls.Add($padding)

    $iconBase64 = 'AAABAAEAFBQAAAEAIACZBAAAFgAAAIlQTkcNChoKAAAADUlIRFIAAAAUAAAAFAgGAAAAjYkdDQAABGBJREFUeJxdlAtMm1UUx78iT3lOhICgyCPhNckwZBMXlxlQqWgWzDQiSqkxkEXTwWIAR5XEEA3gTCuERkayGiuQzALdKFjYGMOVdx2jwNYKHRQWoAHW9CXEUvwf+Robv+SXc+659557v3POPQxz+B0Bp8EYSGVtjEgkUrMqBzzJ/PeVAF+PMXNwcHBkamoq2dN2B6T9b5EfhJefn99vkD+D9zzmZpqbm2chPwe/gx/i4+Mv0pwZPM7MzLwI48nU1NQzRUVFMnZThVgsVrW0tEj1er0qPT3dmZSU9FdKSspKW1vbWnJy8iTB4XDudXd3z7gPe6qgoGAem+/k5+eTo0vgLfAE8BcKhY7W1lZTTEzMGsbTYIFCgPWq0NDQ16G/RE56e3uXyAfd4tXR0dHFzc3NQrohe0gCUGdkZKj7+/v1sD8CnbCdDAkJuQr9/f39fa3D4bgL2wl2zx/uWPir1WqZTqebx2fb29u7S5vBcnt7+2paWtq23W7fwfhXg8Fwq66uzp2ofjBvMpnOYY4S1O0Z/+fABfaAU4ATFBR0DsNvIyIiHjidzrcrKir4RqNRU1xcPAr7FHgFKIA366PL7YzPSopZMLgBh8GRkZErrD0RQb8F6ePv7y+cmJiwy2Syj9m5yOjo6DKsj4HOdTv8t746Ojqej4uLexGqICAgoFMqlX4P/Q1AtfUMoKRo1tfXm7Va7TvQXwMNcHbMZrPpoZ/y/OXooaEhOSZfgH4V3AZfecx/Bn4ExwMDA6VKpXKHOSy3ruzsbPHW1lYb9nLdSZE2NjbmVVVVXYB+Pjw8/HpsbKyOdUQFPQx+Kikp0RcWFo6T0Wq13oOo9vHxycIegcfBsW6nk+A46EpISLAgfufJXl9fTwvsIAFzZ8LCwk5TdlEuyurqasvu7q5+ZGTEAFslc1g+LbTvMhYH0u3AUV9fX7OXlxeVQCJKZhUJ+CY3N5cWPl1ZWZna19e3urKy4uJyubOwfc0mI5GSWlpaqnFfNRinvYmM0aJr4Cy4AoZoEq+go6GhwTw2NvYYMZvZ2dnRosANiOUnqM1LFDZwc2Bg4JHb4dHa2loJHvsG4qPEpAYLLXi/TowdOMyB8d9ms/n+7OzsPuaVkDKBQNCPd3+Mz+fzUK88+OkhZ+9S8BUKRR82GaOiokzYUAqqAA8oNjY2xhFb6igqb2/vT7H+O/YilzE+kZOTk8/j8UQYP0vGD6hshoeHByCXampqriPTH8rl8hu43e3FxUXR9PS0GI1gGg5zXS7XFz09PWuoxYfLy8s6/KZtbm7ugQYf5noow+UgHs4+AhbwZVNTkxXF6sImCxyubW9vX5NIJH9SpoEQa3LBTeawf76Mw36B1KIPUMYZ6jBGsEExQAtbKisrM05OTlqRTWt5eTndXAseLiwskJ7OlloxlRplH+/eBNk5ODhIxc8IqMNAUi+kuKkAdeIR3HIc8n5eXh71QTkYARLahFudRZdao86dlZW1DZMX2f8Bj2eAF8PtWBoAAAAASUVORK5CYII='
    $iconBytes = [Convert]::FromBase64String($iconBase64)
    $stream = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
    $form.Icon = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

    $result = $form.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        return $true, $checkboxRenamePC.Checked, $textBoxPCName.Text, $checkboxAddWiFi.Checked, $textWiFiSSID.Text,
        $textWiFiKey.Text, $checkboxSwitchLanguage.Checked, $textWindowsLocale.Checked, $textWindowsLocaleNumber.Checked,
        $textTimezone.Text, $checkboxActivateWindows.Checked, $checkboxHideSearch.Checked, $checkboxHideTasks.Checked,
        $checkboxHidePeople.Checked, $checkboxHideMeet.Checked, $checkboxHideNews.Checked, $checkboxShowDragContent.Checked,
        $checkboxDisableOneFinger.Checked, $checkboxSetThisPCDefault.checked, $checkboxInstallChocolatey.Checked,
        $checkboxInstallDriverBooster.Checked, $checkboxChocolateyApps.checked, $textChocolateyApps.Text,
        $checkboxInstallOperaProfile.Checked
    }
}

function writeNotification($main, $second)
{
    $null = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
    $null = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]

    [xml]$ToastTemplate = @"
<toast>
    <visual>
        <binding template="ToastImageAndText03">
            <text id="1">$main</text>
            <text id="2">$second</text>
            <image id="1" src="$PSScriptRoot\image.ico" />
        </binding>
    </visual>
</toast>
"@

    $ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::New()
    $ToastXml.LoadXml($ToastTemplate.OuterXml)

    $ToastMessage = [Windows.UI.Notifications.ToastNotification]::New($ToastXML)
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Windows 10 Personalize").Show($ToastMessage)
}

function isChocolateyInstalled()
{
    return Test-Path "C:\ProgramData\chocolatey\choco.exe"
}

function installChocolatey()
{
    if (!(isChocolateyInstalled))
    {
        if (isOnline)
        {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        }
        else
        {
            writeOut "Cannot install Chocolatey - no internet connection"
            writeNotification "Cannot install Chocolatey" "No internet connection"
        }
    }
}

function isDirectXInstalled()
{
    $directxVersion = Get-ItemProperty -Path 'HKLM:\Software\Microsoft\DirectX' -Name Version
    return $directxVersion.Version -eq "4.09.0000.0904" -or $directxVersion.Version -eq "4.09.00.0904"
}

function disableOneFingerTrigger()
{
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
    Add-Type -MemberDefinition $MethodDefinition -Name 'Win32' -NameSpace '' -PassThru | Out-Null
    $startupStickyKeys = New-Object -TypeName 'Win32+STICKYKEYS'
    $startupStickyKeys.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys)
    [Win32]::SystemParametersInfo($get,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0) | Out-Null
    $startupStickyKeys.dwFlags = 506
    [Win32]::SystemParametersInfo($set,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0) | Out-Null
}

function addWiFiEntry()
{
    writeOut "Adding new Wi-Fi entry..."
    $filePath = $tempPath + $WIFI_SSID

    $text = "<?xml version='1.0'?>
<WLANProfile xmlns='http://www.microsoft.com/networking/WLAN/profile/v1'>
    <name>$WIFI_SSID</name>
    <SSIDConfig>
        <SSID>
            <name>$WIFI_SSID</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>$WIFI_KEY</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>"

    Set-Content -Path $filePath -Value $text
    netsh wlan add profile filename = "$filePath" | Out-Null
    netsh wlan connect name = "$WIFI_SSID" | Out-Null
}

function installChocoApp($app)
{
    $command = "choco install $app -y"
    Invoke-Expression $command
}

function isOnline()
{
    return Test-Connection -ComputerName "1.1.1.1" -Count 1 -Quiet
}

function writeOut($text)
{
    Write-Output $text
}


$EXITED, $RENAME_MACHINE, $DEVICE_NAME, $ADD_WIFI_ENTRY, $WIFI_SSID, $WIFI_KEY, $SWITCH_SYSTEM_LANG, $LOCALE,
$LOCALE_NUMBER, $TIMEZONE, $ACTIVATE_WINDOWS, $HIDE_SEARCH, $HIDE_TASKS, $HIDE_PEOPLE, $HIDE_MEET, $HIDE_NEWS,
$SHOW_WINDOW_CONTENT_ON_DRAG, $DISABLE_ONE_FINGER_TRIGGER, $SET_DEFAULT_THIS_PC_VIEW, $INSTALL_CHOCOLATEY,
$INSTALL_DRIVER_BOOSTER, $INSTALL_CHOCO_APPS, $CHOCO_APPS, $INSTALL_OPERA_PROFILE = Show-InputBox

# if true -> window was closed X
if ($null -eq $EXITED)
{
    return
}

writeNotification "The script is running on background"

$tempPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path + "\windows10-personalize-temp\"
$restartExplorer = $false

if (!(Test-Path -Path $tempPath))
{
    writeOut "Creating temp path in $tempPath"
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

if ($ADD_WIFI_ENTRY -and "" -ne $WIFI_SSID)
{
    addWiFiEntry
    writeNotification "Added new Wi-Fi entry"
    Start-Sleep -s 5
}


if (!(isOnline))
{
    writeOut "WARNING: No internet connection!"
}

# Install Visual C++ if is not installed
$vcx86 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Microsoft Visual C++*" } | Select-Object DisplayName, DisplayVersion
$vcx64 = Get-ItemProperty HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Microsoft Visual C++*" } | Select-Object DisplayName, DisplayVersion

if (isOnline)
{
    # Check if either version is installed
    if ($vcx86 -eq $false -and $vcx64 -eq $false)
    {
        writeOut "Installing Visual C++ AIO..."
        writeNotification "Installing Visual C++ AIO..."
        $filePath = $tempPath + "VisualCppRedist_AIO_x86_x64.exe"
        Invoke-WebRequest -Uri "https://github.com/abbodi1406/vcredist/releases/download/v0.73.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "$filePath"
        $command = "$filePath /ai /gm2"
        Invoke-Expression $command
    }
}

# installs directX if is not installed
if (!(isDirectXInstalled))
{
    writeOut "Installing DirectX..."
    writeNotification "Installing DirectX..."
    $filePath = $tempPath + "dxwebsetup.exe"
    Invoke-WebRequest -Uri "https://github.com/ingui-n/windows10-personalize-script/raw/main/etc/dxwebsetup.exe" -OutFile "$filePath"
    $command = "$filePath /Q"
    Invoke-Expression $command
}

# installs chocolatey
if ($INSTALL_CHOCOLATEY -and (isOnline))
{
    writeOut "Installing Chocolatey..."
    writeNotification "Installing Chocolatey..."
    installChocolatey
}

if ($HIDE_SEARCH)
{
    writeOut "Hide the search icon..."
    # removes search icon
    Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search" -Name "SearchBoxTaskbarMode" -Value 0 -Type DWord -Force
    $restartExplorer = $true
}

if ($HIDE_TASKS)
{
    writeOut "Hide the tasks icon..."
    # removes tasks icon
    Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
    $restartExplorer = $true
}

if ($HIDE_PEOPLE)
{
    writeOut "Hide the people icon..."
    # removes people icon
    Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People" -Name "PeopleBand" -Value 0 -Type DWord
    $restartExplorer = $true
}

if ($HIDE_MEET)
{
    writeOut "Hide the meet icon..."
    # removes meet now icon
    Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer" -Name "HideSCAMeetNow" -Value 1
    $restartExplorer = $true
}

if ($HIDE_NEWS)
{
    writeOut "Hide the news icon..."
    # removes news icon
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2
    $restartExplorer = $true
}

if ($SHOW_WINDOW_CONTENT_ON_DRAG)
{
    writeOut "Turn on function: show window contents while dragging..."
    # enables show window contents while dragging
    Set-ItemProperty -Path "HKCU:\\Control Panel\\Desktop" -Name "DragFullWindows" -Value 1
}

if ($SET_DEFAULT_THIS_PC_VIEW)
{
    writeOut "Set This PC as the default in File Explorer..."
    # set the default launch folder to "This PC"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1
}

#renaming device
if ($RENAME_MACHINE -and "" -ne $DEVICE_NAME)
{
    writeOut "Rename this PC..."
    Rename-Computer -NewName $DEVICE_NAME
}

# restarts explorer.exe
if ($restartExplorer)
{
    writeOut "Restart explorer.exe..."
    Stop-Process -Name "explorer" -Force
    Start-Sleep -s 5
}

# disables trigger for one finger prompt
if ($DISABLE_ONE_FINGER_TRIGGER)
{
    writeOut "Disable one finger function trigger..."
    disableOneFingerTrigger
}

if ($SWITCH_WINDOWS_LANGUAGE -and "" -ne $LOCALE -and "" -ne $LOCALE_NUMBER)
{
    writeOut "Switch language..."
    # switches language
    Set-WinUserLanguageList -LanguageList $LOCALE -Force
    Set-WinSystemLocale -SystemLocale $LOCALE
    Set-WinHomeLocation -GeoId $LOCALE_NUMBER
    tzutil /s $TIMEZONE
    Start-Sleep -s 1
}

if ($ACTIVATE_WINDOWS -and "" -ne $WINDOWS_KEY)
{
    if (isOnline)
    {
        writeOut "Activate Windows..."
        writeNotification "Activate Windows..."
        slmgr //b /ipk $WINDOWS_KEY
        slmgr //b /skms kms8.msguides.com
        slmgr //b /ato
    }
    else
    {
        writeOut "Cannot activate Windows - no internet connection"
        writeNotification "Cannot activate Windows" "No internet connection"
    }
}

if ($INSTALL_OPERA_PROFILE)
{
    if (isOnline)
    {
        writeOut "Install Opera clean profile..."
        writeNotification "Install Opera clean profile..."
        $destination = "$env:APPDATA\Opera Software"
        $filePath = $tempPath + "opera-stable-profile.zip"
        Invoke-WebRequest -Uri "https://github.com/ingui-n/windows10-personalize-script/raw/main/etc/opera-stable-profile.zip" -OutFile "$filePath"

        if (!(Test-Path -Path $destination))
        {
            New-Item -ItemType Directory -Path $destination | Out-Null
        }
        else
        {
            if (Test-Path -Path "$destination\Opera Stable")
            {
                Remove-Item -LiteralPath "$destination\Opera Stable" -Force -Recurse
            }
        }

        Expand-Archive -Path $filePath -DestinationPath $destination
    }
    else
    {
        writeOut "Cannot install Opera clean profile - no internet connection"
        writeNotification "Cannot install Opera clean profile" "No internet connection"
    }
}

if ($INSTALL_DRIVER_BOOSTER)
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    if (isOnline)
    {
        writeOut "Install Driver Booster..."
        writeNotification "Install Driver Booster..."
        choco install driverbooster -y
    }
    else
    {
        writeOut "Cannot install Driver Booster - no internet connection"
        writeNotification "Cannot install Driver Booster" "No internet connection"
    }
}

if ($INSTALL_CHOCO_APPS -and $CHOCO_APPS -ne "")
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    if (isOnline)
    {
        foreach ($app in $CHOCO_APPS.split(" "))
        {
            writeOut "Installing $app..."
            writeNotification "Installing $app..."
            installChocoApp $app

            Start-Sleep -s 3

            $isInstalled = choco list | Select-String -Pattern "^$app\s"

            if (!$isInstalled)
            {
                writeOut "Installation of $app failed"
                writeNotification "Installation of $app failed"
            }
        }
    }
    else
    {
        writeOut "Cannot install $app - no internet connection"
        writeNotification "Cannot install $app" "No internet connection"
    }
}

writeOut "Remove temp directory $tempPath"
Remove-Item -Path $tempPath -Recurse
writeNotification "The script has finished"

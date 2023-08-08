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
    $form.maximumSize = New-Object System.Drawing.Size(350, 870)
    $form.MaximizeBox = $false

    $form.Font = New-Object System.Drawing.Font("Arial", 10)

    # rename PC
    $checkboxRenamePC = new-object System.Windows.Forms.checkbox
    $checkboxRenamePC.Location = new-object System.Drawing.Size(10, 10)
    $checkboxRenamePC.Text = "Rename PC"
    $checkboxRenamePC.Checked = $true
    $form.Controls.Add($checkboxRenamePC)

    $labelPCName = New-Object System.Windows.Forms.Label
    $labelPCName.Location = New-Object System.Drawing.Point(10, 40)
    $labelPCName.Text = "New PC name:"
    $form.Controls.Add($labelPCName)

    $textBoxPCName = New-Object System.Windows.Forms.TextBox
    $textBoxPCName.Location = New-Object System.Drawing.Point(150, (40 - 3))
    $textBoxPCName.Text = ""
    $textBoxPCName.width = 150
    $form.Controls.Add($textBoxPCName)


    # add wifi entry
    $checkboxAddWiFi = new-object System.Windows.Forms.checkbox
    $checkboxAddWiFi.Location = new-object System.Drawing.Size(10, 70)
    $checkboxAddWiFi.Text = "Add WiFi entry"
    $checkboxAddWiFi.width = 120
    $checkboxAddWiFi.Checked = $true
    $form.Controls.Add($checkboxAddWiFi)

    $labelWiFiSSID = New-Object System.Windows.Forms.Label
    $labelWiFiSSID.Location = New-Object System.Drawing.Point(10, 100)
    $labelWiFiSSID.Text = "WiFi SSID:"
    $form.Controls.Add($labelWiFiSSID)

    $textWiFiSSID = New-Object System.Windows.Forms.TextBox
    $textWiFiSSID.Location = New-Object System.Drawing.Point(150, (100 - 3))
    $textWiFiSSID.Text = ""
    $textWiFiSSID.width = 150
    $form.Controls.Add($textWiFiSSID)

    $labelWiFiKey = New-Object System.Windows.Forms.Label
    $labelWiFiKey.Location = New-Object System.Drawing.Point(10, 130)
    $labelWiFiKey.Text = "WiFi Key:"
    $form.Controls.Add($labelWiFiKey)

    $textWiFiKey = New-Object System.Windows.Forms.TextBox
    $textWiFiKey.Location = New-Object System.Drawing.Point(150, (130 - 3))
    $textWiFiKey.Text = ""
    $textWiFiKey.width = 150
    $form.Controls.Add($textWiFiKey)


    # language
    $checkboxChangeWindowsLanguage = new-object System.Windows.Forms.checkbox
    $checkboxChangeWindowsLanguage.Location = new-object System.Drawing.Size(10, 160)
    $checkboxChangeWindowsLanguage.Text = "Change Windows language"
    $checkboxChangeWindowsLanguage.width = 300
    $checkboxChangeWindowsLanguage.Checked = $true
    $form.Controls.Add($checkboxChangeWindowsLanguage)

    $checkboxChangeWindowsKeyboard = new-object System.Windows.Forms.checkbox
    $checkboxChangeWindowsKeyboard.Location = new-object System.Drawing.Size(10, 190)
    $checkboxChangeWindowsKeyboard.Text = "Change keyboard language"
    $checkboxChangeWindowsKeyboard.width = 300
    $checkboxChangeWindowsKeyboard.Checked = $true
    $form.Controls.Add($checkboxChangeWindowsKeyboard)

    $checkboxWindowsLocale = new-object System.Windows.Forms.checkbox
    $checkboxWindowsLocale.Location = new-object System.Drawing.Size(10, 220)
    $checkboxWindowsLocale.Text = "Change Windows locale"
    $checkboxWindowsLocale.width = 300
    $checkboxWindowsLocale.Checked = $true
    $form.Controls.Add($checkboxWindowsLocale)

    $labelWindowsLocale = New-Object System.Windows.Forms.Label
    $labelWindowsLocale.Location = New-Object System.Drawing.Point(10, 250)
    $labelWindowsLocale.width = 130
    $labelWindowsLocale.Text = "Windows locale:"
    $form.Controls.Add($labelWindowsLocale)

    $textWindowsLocale = New-Object System.Windows.Forms.TextBox
    $textWindowsLocale.Location = New-Object System.Drawing.Point(150, (250 - 3))
    $textWindowsLocale.Text = "cs-CZ"
    $textWindowsLocale.width = 150
    $form.Controls.Add($textWindowsLocale)

    $labelWindowsLocaleNumber = New-Object System.Windows.Forms.Label
    $labelWindowsLocaleNumber.Location = New-Object System.Drawing.Point(10, 280)
    $labelWindowsLocaleNumber.width = 140
    $labelWindowsLocaleNumber.Text = "Windows locale num:"
    $form.Controls.Add($labelWindowsLocaleNumber)

    $textWindowsLocaleNumber = New-Object System.Windows.Forms.TextBox
    $textWindowsLocaleNumber.Location = New-Object System.Drawing.Point(150, (280 - 3))
    $textWindowsLocaleNumber.Text = "75"
    $textWindowsLocaleNumber.width = 150
    $form.Controls.Add($textWindowsLocaleNumber)


    # windows main panel
    $checkboxHideSearch = new-object System.Windows.Forms.checkbox
    $checkboxHideSearch.Location = new-object System.Drawing.Size(10, 310)
    $checkboxHideSearch.Text = "Hide search from main panel"
    $checkboxHideSearch.width = 300
    $checkboxHideSearch.Checked = $true
    $form.Controls.Add($checkboxHideSearch)

    $checkboxHideTasks = new-object System.Windows.Forms.checkbox
    $checkboxHideTasks.Location = new-object System.Drawing.Size(10, 340)
    $checkboxHideTasks.Text = "Hide tasks from main panel"
    $checkboxHideTasks.width = 300
    $checkboxHideTasks.Checked = $true
    $form.Controls.Add($checkboxHideTasks)

    $checkboxHidePeople = new-object System.Windows.Forms.checkbox
    $checkboxHidePeople.Location = new-object System.Drawing.Size(10, 370)
    $checkboxHidePeople.Text = "Hide people from main panel"
    $checkboxHidePeople.width = 300
    $checkboxHidePeople.Checked = $true
    $form.Controls.Add($checkboxHidePeople)

    $checkboxHideMeet = new-object System.Windows.Forms.checkbox
    $checkboxHideMeet.Location = new-object System.Drawing.Size(10, 400)
    $checkboxHideMeet.Text = "Hide meet from main panel"
    $checkboxHideMeet.width = 300
    $checkboxHideMeet.Checked = $true
    $form.Controls.Add($checkboxHideMeet)

    $checkboxHideNews = new-object System.Windows.Forms.checkbox
    $checkboxHideNews.Location = new-object System.Drawing.Size(10, 430)
    $checkboxHideNews.Text = "Hide news from main panel"
    $checkboxHideNews.width = 300
    $checkboxHideNews.Checked = $true
    $form.Controls.Add($checkboxHideNews)

    $checkboxShowDragContent = new-object System.Windows.Forms.checkbox
    $checkboxShowDragContent.Location = new-object System.Drawing.Size(10, 460)
    $checkboxShowDragContent.Text = "Show window content on drag"
    $checkboxShowDragContent.width = 300
    $checkboxShowDragContent.Checked = $true
    $form.Controls.Add($checkboxShowDragContent)

    $checkboxDisableOneFinger = new-object System.Windows.Forms.checkbox
    $checkboxDisableOneFinger.Location = new-object System.Drawing.Size(10, 490)
    $checkboxDisableOneFinger.Text = "Disable one finger function trigger"
    $checkboxDisableOneFinger.width = 300
    $checkboxDisableOneFinger.Checked = $true
    $form.Controls.Add($checkboxDisableOneFinger)

    $checkboxSetThisPCDefault = new-object System.Windows.Forms.checkbox
    $checkboxSetThisPCDefault.Location = new-object System.Drawing.Size(10, 520)
    $checkboxSetThisPCDefault.Text = "Set default folder to This PC"
    $checkboxSetThisPCDefault.width = 300
    $checkboxSetThisPCDefault.Checked = $true
    $form.Controls.Add($checkboxSetThisPCDefault)


    # Opera profile
    $checkboxInstallOperaProfile = new-object System.Windows.Forms.checkbox
    $checkboxInstallOperaProfile.Location = new-object System.Drawing.Size(10, 550)
    $checkboxInstallOperaProfile.Text = "Install Opera clean profile"
    $checkboxInstallOperaProfile.width = 300
    $checkboxInstallOperaProfile.Checked = $true
    $form.Controls.Add($checkboxInstallOperaProfile)


    # Chocloatey
    $checkboxInstallChocolatey = new-object System.Windows.Forms.checkbox
    $checkboxInstallChocolatey.Location = new-object System.Drawing.Size(10, 580)
    $checkboxInstallChocolatey.Text = "Install Chocolatey"
    $checkboxInstallChocolatey.width = 300
    $checkboxInstallChocolatey.Checked = $true
    $form.Controls.Add($checkboxInstallChocolatey)

    $checkboxInstallDriverBooster = new-object System.Windows.Forms.checkbox
    $checkboxInstallDriverBooster.Location = new-object System.Drawing.Size(10, 610)
    $checkboxInstallDriverBooster.Text = "Install Iobit Driver Booster"
    $checkboxInstallDriverBooster.width = 300
    $checkboxInstallDriverBooster.Checked = $true
    $form.Controls.Add($checkboxInstallDriverBooster)

    $labelChocolateyApps = New-Object System.Windows.Forms.Label
    $labelChocolateyApps.Location = New-Object System.Drawing.Point(10, 640)
    $labelChocolateyApps.width = 300
    $labelChocolateyApps.Text = "Chocolatey apps to install:"
    $form.Controls.Add($labelChocolateyApps)

    $textChocolateyApps = New-Object System.Windows.Forms.TextBox
    $textChocolateyApps.Location = New-Object System.Drawing.Point(10, 670)
    $textChocolateyApps.Size = New-Object System.Drawing.Size(300, 100)
    $textChocolateyApps.Text = "opera vlc steam netlimiter deskpins anydesk lightshot discord intellijidea-ultimate eartrumpet translucenttb"
    $textChocolateyApps.Multiline = $true
    $textChocolateyApps.Scrollbars = "Vertical"
    $textChocolateyApps.Font = New-Object System.Drawing.Font("Arial", 11)
    $form.Controls.Add($textChocolateyApps)


    $buttonSubmit = New-Object System.Windows.Forms.Button
    $buttonSubmit.Location = New-Object System.Drawing.Point(230, 790)
    $buttonSubmit.Size = New-Object System.Drawing.Size(75, 23)
    $buttonSubmit.Text = "Run"
    $buttonSubmit.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.Controls.Add($buttonSubmit)
    $form.AcceptButton = $buttonSubmit

    $padding = New-Object System.Windows.Forms.Label
    $padding.Location = New-Object System.Drawing.Point(10, 800)
    $form.Controls.Add($padding)

    $iconBase64 = 'AAABAAEAFBQAAAEAIACZBAAAFgAAAIlQTkcNChoKAAAADUlIRFIAAAAUAAAAFAgGAAAAjYkdDQAABGBJREFUeJxdlAtMm1UUx78iT3lOhICgyCPhNckwZBMXlxlQqWgWzDQiSqkxkEXTwWIAR5XEEA3gTCuERkayGiuQzALdKFjYGMOVdx2jwNYKHRQWoAHW9CXEUvwf+Robv+SXc+659557v3POPQxz+B0Bp8EYSGVtjEgkUrMqBzzJ/PeVAF+PMXNwcHBkamoq2dN2B6T9b5EfhJefn99vkD+D9zzmZpqbm2chPwe/gx/i4+Mv0pwZPM7MzLwI48nU1NQzRUVFMnZThVgsVrW0tEj1er0qPT3dmZSU9FdKSspKW1vbWnJy8iTB4XDudXd3z7gPe6qgoGAem+/k5+eTo0vgLfAE8BcKhY7W1lZTTEzMGsbTYIFCgPWq0NDQ16G/RE56e3uXyAfd4tXR0dHFzc3NQrohe0gCUGdkZKj7+/v1sD8CnbCdDAkJuQr9/f39fa3D4bgL2wl2zx/uWPir1WqZTqebx2fb29u7S5vBcnt7+2paWtq23W7fwfhXg8Fwq66uzp2ofjBvMpnOYY4S1O0Z/+fABfaAU4ATFBR0DsNvIyIiHjidzrcrKir4RqNRU1xcPAr7FHgFKIA366PL7YzPSopZMLgBh8GRkZErrD0RQb8F6ePv7y+cmJiwy2Syj9m5yOjo6DKsj4HOdTv8t746Ojqej4uLexGqICAgoFMqlX4P/Q1AtfUMoKRo1tfXm7Va7TvQXwMNcHbMZrPpoZ/y/OXooaEhOSZfgH4V3AZfecx/Bn4ExwMDA6VKpXKHOSy3ruzsbPHW1lYb9nLdSZE2NjbmVVVVXYB+Pjw8/HpsbKyOdUQFPQx+Kikp0RcWFo6T0Wq13oOo9vHxycIegcfBsW6nk+A46EpISLAgfufJXl9fTwvsIAFzZ8LCwk5TdlEuyurqasvu7q5+ZGTEAFslc1g+LbTvMhYH0u3AUV9fX7OXlxeVQCJKZhUJ+CY3N5cWPl1ZWZna19e3urKy4uJyubOwfc0mI5GSWlpaqnFfNRinvYmM0aJr4Cy4AoZoEq+go6GhwTw2NvYYMZvZ2dnRosANiOUnqM1LFDZwc2Bg4JHb4dHa2loJHvsG4qPEpAYLLXi/TowdOMyB8d9ms/n+7OzsPuaVkDKBQNCPd3+Mz+fzUK88+OkhZ+9S8BUKRR82GaOiokzYUAqqAA8oNjY2xhFb6igqb2/vT7H+O/YilzE+kZOTk8/j8UQYP0vGD6hshoeHByCXampqriPTH8rl8hu43e3FxUXR9PS0GI1gGg5zXS7XFz09PWuoxYfLy8s6/KZtbm7ugQYf5noow+UgHs4+AhbwZVNTkxXF6sImCxyubW9vX5NIJH9SpoEQa3LBTeawf76Mw36B1KIPUMYZ6jBGsEExQAtbKisrM05OTlqRTWt5eTndXAseLiwskJ7OlloxlRplH+/eBNk5ODhIxc8IqMNAUi+kuKkAdeIR3HIc8n5eXh71QTkYARLahFudRZdao86dlZW1DZMX2f8Bj2eAF8PtWBoAAAAASUVORK5CYII='
    $iconBytes = [Convert]::FromBase64String($iconBase64)
    $stream = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
    $form.Icon = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

    $result = $form.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        return $true, $checkboxRenamePC.Checked, $textBoxPCName.Text, $checkboxAddWiFi.Checked, $textWiFiSSID.Text,
        $textWiFiKey.Text, $checkboxChangeWindowsLanguage.Checked, $checkboxChangeWindowsKeyboard.Checked,
        $checkboxWindowsLocale.Checked, $textWindowsLocale.Text, $textWindowsLocaleNumber.Text,
        $checkboxHideSearch.Checked, $checkboxHideTasks.Checked, $checkboxHidePeople.Checked,
        $checkboxHideMeet.Checked, $checkboxHideNews.Checked, $checkboxShowDragContent.Checked,
        $checkboxDisableOneFinger.Checked, $checkboxInstallChocolatey.Checked, $checkboxInstallDriverBooster.Checked,
        $textChocolateyApps.Text, $checkboxInstallOperaProfile.Checked
    }
}

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

$EXITED, $RENAME_MACHINE, $DEVICE_NAME, $ADD_WIFI_ENTRY, $WIFI_SSID, $WIFI_KEY, $CHANGE_WINDOWS_LANG, $CHANGE_WINDOWS_KEYBOARD,
$CHANGE_WINDOWS_LOCALE, $LOCALE, $LOCALE_NUMBER, $HIDE_SEARCH, $HIDE_TASKS, $HIDE_PEOPLE, $HIDE_MEET, $HIDE_NEWS,
$SHOW_WINDOW_CONTENT_ON_DRAG, $DISABLE_ONE_FINGER_TRIGGER, $INSTALL_CHOCOLATEY, $INSTALL_DRIVER_BOOSTER,
$CHOCO_APPS, $INSTALL_OPERA_PROFILE, $SET_DEFAULT_THIS_PC_VIEW = Show-InputBox

if ($EXITED -eq $null)
{
    return
}

$isOnline = Test-Connection -ComputerName "1.1.1.1" -Count 1 -Quiet
$tempPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path + "\windows10-personalize-temp\"

if (!(Test-Path -Path $tempPath))
{
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

if ($ADD_WIFI_ENTRY -and "" -ne $WIFI_SSID -and "" -ne $WIFI_KEY)
{
    $filePath = $tempPath + $WIFI_SSID
    Invoke-WebRequest -Uri "https://github.com/ingui-n/windows10-personalize-script/raw/main/etc/wifi-entry.xml" -OutFile "$filePath"

    (Get-Content $filePath) | ForEach-Object { $_ -replace '{SSID}', $WIFI_SSID } | Set-Content $filePath
    (Get-Content $filePath) | ForEach-Object { $_ -replace '{PASSWORD}', $WIFI_KEY } | Set-Content $filePath
    netsh wlan add profile filename = "$filePath" | Out-Null
    netsh wlan connect name = "$WIFI_SSID" | Out-Null
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
        Invoke-WebRequest -Uri "https://github.com/abbodi1406/vcredist/releases/download/v0.73.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "$filePath"
        $command = "$filePath /ai /gm2"
        Invoke-Expression $command
    }
}

# installs directX if is not installed
if (!(isDirectXInstalled))
{
    $filePath = $tempPath + "dxwebsetup.exe"
    Invoke-WebRequest -Uri "https://github.com/ingui-n/windows10-personalize-script/raw/main/etc/dxwebsetup.exe" -OutFile "$filePath"
    $command = "$filePath /Q"
    Invoke-Expression $command
}

# installs chocolatey
if ($INSTALL_CHOCOLATEY -and $isOnline)
{
    installChocolatey
}

# synchonizes time
#w32tm /resync /force

if ($HIDE_SEARCH)
{
    # removes search icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force
}

if ($HIDE_TASKS)
{
    # removes tasks icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced -Name ShowTaskViewButton -Type DWord -Value 0
}

if ($HIDE_PEOPLE)
{
    # removes people icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People -Name PeopleBand -Value 0 -Type DWord
}

if ($HIDE_MEET)
{
    # removes meet now icon
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer -Name HideSCAMeetNow -Value 1
}

if ($HIDE_NEWS)
{
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2
}

if ($SHOW_WINDOW_CONTENT_ON_DRAG)
{
    # enables show window contents while dragging
    Set-ItemProperty -Path "HKCU:\\Control Panel\\Desktop" -Name "DragFullWindows" -Value 1
}

if ($SET_DEFAULT_THIS_PC_VIEW)
{
    # set the default launch folder to "This PC"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1
}

#renaming device
if ($RENAME_MACHINE -and "" -ne $DEVICE_NAME)
{
    Rename-Computer -NewName $DEVICE_NAME
}

# restarts explorer.exe
Stop-Process -Name "explorer" -Force

if ($DISABLE_ONE_FINGER_TRIGGER)
{
    # disbales trigger for one finger prompt
    $startupStickyKeys = New-Object -TypeName 'Win32+STICKYKEYS'
    $startupStickyKeys.cbSize = [System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys)
    $startupStickyKeys.dwFlags = 506
    [Win32]::SystemParametersInfo(0x003B,[System.Runtime.InteropServices.Marshal]::SizeOf($startupStickyKeys), [ref]$startupStickyKeys, 0)
}

if ($CHANGE_WINDOWS_LANG -and "" -ne $LOCALE)
{
    # set language to czech
    $LanguageList = Get-WinUserLanguageList
    $LanguageList.Add("$LOCALE")

    if ($CHANGE_WINDOWS_KEYBOARD)
    {
        # set keyboard to czech
        Set-WinUserLanguageList -LanguageList $LanguageList -Force
    }
}

if ($CHANGE_WINDOWS_LOCALE -and "" -ne $LOCALE -and "" -ne $LOCALE_NUMBER)
{
    # switch loacale
    Set-WinSystemLocale -SystemLocale "$LOCALE"
    Set-WinHomeLocation -GeoId $LOCALE_NUMBER
}

if ($INSTALL_OPERA_PROFILE)
{
    $destination = "$APPDATA\Opera Software"
    $filePath = $tempPath + "opera-stable-profile.zip"
    Invoke-WebRequest -Uri "https://github.com/ingui-n/windows10-personalize-script/raw/main/etc/opera-stable-profile.zip" -OutFile "$filePath"

    if (!(Test-Path -Path $destination))
    {
        New-Item -ItemType Directory -Path $destination
    }

    Expand-Archive -Path $filePath -DestinationPath $destination
}

if ($INSTALL_DRIVER_BOOSTER)
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    choco install driverbooster -y
}

if ($CHOCO_APPS -ne "")
{
    if (!(isChocolateyInstalled))
    {
        installChocolatey
    }

    choco install $CHOCO_APPS -y
}

Remove-Item -Path $tempPath -Recurse

# synchonizes time
#w32tm /resync /force

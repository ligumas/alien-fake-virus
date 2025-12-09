@echo off
title ⟊⟁𖤐 ALIEN PROTOCOL █████
setlocal enabledelayedexpansion
color 0A

:: ⟊⟁𖤐 — JÄRJESTELMÄNVALVOJAN TARKISTUS (ALIEN-MUOTO)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ⟊⟁𖤐⟁⟟⧖⧃ 𖤣⟊⟁ ⟟⟊𐍈 ⧖⟁ ✦✦✦ ADMIN ✦✦✦ ⧃⧠𖤣
    pause
    exit /b
)

:: ⟊⟁𖤐 — PROTOKOLLIN ALUSTUS
set pads=15
set lines=40
set wallpaper=%~dp0alien.jpg
set beeps=50
set popups=5
set loopcount=30

set messages[0]=👽 Tervetuloa maapallolle!
set messages[1]=🛸 Olet havaittu!
set messages[2]=✨ Alieneilla on silmät päällä!
set messages[3]=⟁⊹ Ole varuillasi!
set messages[4]=🜁🜎 Suunnitelma käynnissä!

:: ⟊⟁𖤐 — TAUSTA PROJEKTIO
if exist "%wallpaper%" (
    powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(""user32.dll"", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%wallpaper%',3)"
) else (
    echo ⟟⟊𐍈 ⧖⟁ ⟊𖤐✦ PROJEKTIO ⟊🜄𖤐 ✦✦✦
)

:: ⟊⟁𖤐 — NOTEPAD‑KAUTTA INFORM AALTO
for /l %%p in (1,1,%pads%) do (
    set "outfile=alien_%%p.txt"
    > "!outfile!" (
        for /l %%i in (1,1,%lines%) do (
            set /a rand=!random! %% 5
            if !rand!==0 echo 👽𖤐✨🛸⟁⟟⟊
            if !rand!==1 echo ⟟⟊𐍈𖣘▜⧖
            if !rand!==2 echo ⧃⧠𖤣🜁🜎✨
            if !rand!==3 echo ⟁𖤐⡡⟟𖣘⊹
            if !rand!==4 echo ⟊🜄𖠑𖤓⧖𖠿🛸
        )
    )
    start "" notepad.exe "!outfile!"
)

:: ⟊⟁𖤐 — PÄÄ SILMUKKA — TRANS AIKA
for /l %%l in (1,1,%loopcount%) do (

    :: Putoava alien-data
    for /l %%i in (1,1,20) do (
        set "line="
        for /l %%j in (1,1,10) do (
            set /a r=!random! %% 5
            if !r!==0 set "char=👽"
            if !r!==1 set "char=🛸"
            if !r!==2 set "char=✨"
            if !r!==3 set "char=⟁"
            if !r!==4 set "char=⟊"
            set "line=!line!!char!"
        )
        echo !line!
        powershell -command "Start-Sleep -Milliseconds 80"
    )

    :: ÄÄNI‑AALTO
    for /l %%b in (1,1,5) do (
        powershell -c "[console]::beep((500 + (Get-Random -Maximum 1000)),200)"
    )

    :: Popup‑lähetys
    set /a popupRand=!random! %% %popups%
    powershell -command ^
    "[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; ^
    $Template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; ^
    $Xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($Template); ^
    $TextNodes = $Xml.GetElementsByTagName('text'); ^
    $TextNodes.Item(0).AppendChild($Xml.CreateTextNode('👽 Alien')) > $null; ^
    $TextNodes.Item(1).AppendChild($Xml.CreateTextNode('%messages[%popupRand%]%')) > $null; ^
    $Toast = [Windows.UI.Notifications.ToastNotification]::new($Xml); ^
    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Alien Script'); ^
    $Notifier.Show($Toast)"
)

echo ⟊⟁𖤐 PROTOKOLLI ║ VALMIS ║ ⧖⟟✨
pause

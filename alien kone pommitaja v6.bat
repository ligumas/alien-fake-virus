@echo off
title Alien-teksti + Efektit
setlocal enabledelayedexpansion

:: =======================================
:: Asetukset
:: =======================================
set pads=10
set lines=50
set wallpaper=C:\Users\Käyttäjä\Pictures\allu.jpg

:: Satunnaiset alien-popup-viestit
set messages[0]=👽 Tervetuloa maapallolle!
set messages[1]=🛸 Olet havaittu!
set messages[2]=✨ Alieneilla on silmät päällä!
set messages[3]=⟁⊹ Ole varuillasi!
set messages[4]=🜁🜎 Suunnitelma käynnissä!

:: =======================================
:: Tarkistetaan järjestelmänvalvoja
:: =======================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Kaynnista skripti jarjestelmanvalvojana!
    pause
    exit /b
)

:: =======================================
:: Vaihdetaan taustakuva
:: =======================================
if exist "%wallpaper%" (
    powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%wallpaper%',3)"
    echo Taustakuva vaihdettu: %wallpaper%
) else (
    echo Taustakuvaa %wallpaper% ei loydy!
)

:: =======================================
:: Näytetään System Info
:: =======================================
echo Näytetään System Information...
systeminfo
echo.

:: =======================================
:: Alien popup ilmoitus - tervetuloa
:: =======================================
powershell -command ^
"[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; ^
$Template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; ^
$Xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($Template); ^
$TextNodes = $Xml.GetElementsByTagName('text'); ^
$TextNodes.Item(0).AppendChild($Xml.CreateTextNode('👽 Alien sanoo:')) > $null; ^
$TextNodes.Item(1).AppendChild($Xml.CreateTextNode('Terveisiä maapallon asukkaille!')) > $null; ^
$Toast = [Windows.UI.Notifications.ToastNotification]::new($Xml); ^
$Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Alien Script'); ^
$Notifier.Show($Toast)"

:: =======================================
:: CMD-ikkunan väri Matrix-tyyliin
:: =======================================
color 0A

:: =======================================
:: Alien Notepad -tekstit
:: =======================================
echo Luodaan %pads% alien-tekstitiedostoa...
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
    echo Avataan: !outfile!
    start "" notepad.exe "!outfile!"
)

:: =======================================
:: Putoava alien-teksti CMD-ikkunaan
:: =======================================
echo.
echo Käynnistetään putoava alien-teksti...
for /l %%i in (1,1,50) do (
    set /a rand=!random! %% 5
    if !rand!==0 echo 👽𖤐✨🛸⟁⟟⟊
    if !rand!==1 echo ⟟⟊𐍈𖣘▜⧖
    if !rand!==2 echo ⧃⧠𖤣🜁🜎✨
    if !rand!==3 echo ⟁𖤐⡡⟟𖣘⊹
    if !rand!==4 echo ⟊🜄𖠑𖤓⧖𖠿🛸
    timeout /t 0.1 >nul
)

:: =======================================
:: Extended Alien äänitehosteita
:: =======================================
echo Soitetaan alien-ääniä...
for /l %%i in (1,1,30) do (
    set /a freq=800 + (!random! %% 1200)
    set /a dur=50 + (!random! %% 300)
    powershell -c "[console]::beep(!freq!,!dur!)"
    timeout /t 0.05 >nul
)

:: =======================================
:: Satunnaiset alien-popupit
:: =======================================
for /l %%i in (1,1,5) do (
    set /a r=!random! %% 5
    powershell -command ^
    "[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; ^
    $Template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; ^
    $Xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($Template); ^
    $TextNodes = $Xml.GetElementsByTagName('text'); ^
    $TextNodes.Item(0).AppendChild($Xml.CreateTextNode('👽 Alien')) > $null; ^
    $TextNodes.Item(1).AppendChild($Xml.CreateTextNode('%messages[%r%]%')) > $null; ^
    $Toast = [Windows.UI.Notifications.ToastNotification]::new($Xml); ^
    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Alien Script'); ^
    $Notifier.Show($Toast)"
    timeout /t 2 >nul
)

echo Skripti valmis!
pause


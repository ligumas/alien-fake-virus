@echo off
setlocal enabledelayedexpansion
title 𖤐⟁⟟🛸 ALIEN SHOW 4.0 𖤐⟁⟟🛸
color 0A

:: =============================
:: REAL MOUSE ACCELERATION ON
:: =============================
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
echo 👽 Real mouse acceleration activated.

:: =============================
:: WALLPAPER SETUP
:: =============================
set alienWallpaper=%~dp0allu.png
set putinScreen=%~dp0ezs.png

:: Change desktop wallpaper to alien wallpaper
if exist "%alienWallpaper%" (
    powershell -command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(""user32.dll"", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20,0,'%alienWallpaper%',3)"
    echo ⟊⟟⧖ Alien wallpaper activated
)

:: Open Putin screen image in default viewer
if exist "%putinScreen%" (
    start "" "%putinScreen%"
    echo ⟊⟟⧖ Putin screen activated
)

:: =============================
:: INITIAL ALIEN BEEP
:: =============================
powershell -c "[console]::beep(900,300)"
powershell -c "[console]::beep(1200,200)"
powershell -c "[console]::beep(600,200)"

:: =============================
:: ALIEN ASCII LOGO
:: =============================
cls
echo.
echo      𖤐 ⟁ ⧖ ⟊ 🛸 𖤐
echo      ⟟⟊⧖⟁ 𖤐⟟⟊🛸⧠𖤐⟊
echo      𖤐 🛸 ⟁ ⧖ 𖤐
echo.
timeout /t 1 >nul

:: =============================
:: SYSTEM SCAN EFFECT
:: =============================
echo ⟁⧖⟟⟊𖤐⟊⟊𖤐⟁⧠𖤐...
powershell -command "Start-Sleep -Milliseconds 700"
for /l %%i in (1,1,20) do (
    set /a r=!random! %% 4
    if !r!==0 echo ⟟⟊𖤐⧃⟁⟊𖤓⧖𖤐...
    if !r!==1 echo 🛸𖣘⟁⧖⟟𖤐⡡⧃...
    if !r!==2 echo ✨𖤐⡡⟁⧠⟟⧃⧖...
    if !r!==3 echo 👽⧠𖤓⟟𖤐⟊⧠...
    powershell -command "Start-Sleep -Milliseconds 200"
)
timeout /t 1 >nul

:: =============================
:: OPEN ALIEN NOTEPADS
:: =============================
for /l %%p in (1,1,6) do (
    set "file=alien_%%p.txt"
    break>"!file!"
    for /l %%i in (1,1,50) do (
        set /a r=!random! %% 5
        if !r!==0 echo 👽𖤐✨🛸⟁⟟⟊>>"!file!"
        if !r!==1 echo ⟟⟊𐍈𖣘▜⧖>>"!file!"
        if !r!==2 echo ⧃⧠𖤣🜁🜎✨>>"!file!"
        if !r!==3 echo ⟁𖤐⡡⟟𖣘⊹>>"!file!"
        if !r!==4 echo ⟊🜄𖠑𖤓⧖𖠿🛸>>"!file!"
    )
    start "" notepad "!file!"
)
timeout /t 1 >nul

:: =============================
:: POPUP MESSAGES
:: =============================
set msg[0]=👽 Terve, maapallon olento.
set msg[1]=🛸 Skannaus käynnissä...
set msg[2]=✨ Havaitsimme sinut.
set msg[3]=⟁ Ulkoavaruus tarkkailee.
set msg[4]=𖤐 Signaali vastaanotettu.

for /l %%i in (1,1,5) do (
    set /a n=!random! %% 5
    powershell -command ^
    "$t=[Windows.UI.Notifications.ToastNotificationManager];$x=$t::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02);$n=$x.GetElementsByTagName('text');$n.Item(0).AppendChild($x.CreateTextNode('👽 ALIEN MESSAGE'));$n.Item(1).AppendChild($x.CreateTextNode('!msg[%n%]!'));$toast=[Windows.UI.Notifications.ToastNotification]::new($x);$not=$t::CreateToastNotifier('Alien');$not.Show($toast)"
    powershell -c "[console]::beep((500 + (Get-Random -Maximum 1200)),200)"
    timeout /t 1 >nul
)

:: =============================
:: MATRIX-STYLE DROPS
:: =============================
cls
for /l %%i in (1,1,80) do (
    set "line="
    for /l %%j in (1,1,30) do (
        set /a r=!random! %% 5
        if !r!==0 set "ch=𖤐"
        if !r!==1 set "ch=⟊"
        if !r!==2 set "ch=✨"
        if !r!==3 set "ch=🛸"
        if !r!==4 set "ch=⟁"
        set "line=!line!!ch!"
    )
    echo !line!
    powershell -command "Start-Sleep -Milliseconds 70"
)

:: =============================
:: ALIEN FLASH COLORS & BEEPS
:: =============================
for /l %%c in (1,1,10) do (
    color 0A
    powershell -c "[console]::beep(1200,70)"
    powershell -command "Start-Sleep -Milliseconds 100"
    color 0C
    powershell -c "[console]::beep(900,70)"
    powershell -command "Start-Sleep -Milliseconds 100"
    color 0E
    powershell -c "[console]::beep(700,70)"
    powershell -command "Start-Sleep -Milliseconds 100"
)

:: =============================
:: END SHOW
:: =============================
cls
echo.
echo       𖤐⟊⟁✨🛸 𖤐⟊⟁✨🛸
echo       ⟁⧖⟟⟊𖤐⟊ SHOW COMPLETE ⟁⧖⟟⟊𖤐⟊
echo       𖤐⟊⟁✨🛸 𖤐⟊⟁✨🛸
echo.
powershell -c "[console]::beep(600,200)"
pause
exit

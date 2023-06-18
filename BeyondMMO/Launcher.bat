@echo off
color 0f
title BeyondMMO - Luancher
mode con cols=45 lines=35
setlocal enabledelayedexpansion
set cup=w
set cdown=s
set cleft=a
set cright=d
set cinv=i
set cpot=q
set cmenu=c
set cchat=t
set select=1
if exist "gamedata\data\controls.bat" call "gamedata\data\controls.bat"
if not exist "gamedata\data\controls.bat" (
echo set cup=!cup!>"gamedata\data\controls.bat"
echo set cdown=!cdown!>>"gamedata\data\controls.bat"
echo set cleft=!cleft!>>"gamedata\data\controls.bat"
echo set cright=!cright!>>"gamedata\data\controls.bat"
echo set cinv=!cinv!>>"gamedata\data\controls.bat"
echo set cpot=!cpot!>>"gamedata\data\controls.bat"
echo set cmenu=!cmenu!>>"gamedata\data\controls.bat"
echo set cchat=!cchat!>>"gamedata\data\controls.bat"
)
net use Y: /delete
set msplash=y
set nsplash=y
goto startgame

:startgame
cls
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo ---------------------------------------
echo Welcome to the BeyondMMO Luncher.
echo ---------------------------------------
echo Current Version: v1.0 Beta_Test
echo What would you like to do?
echo.
echo [%s1%] Play
echo [%s2%] News
echo [%s3%] Credits
echo [%s4%] Hall Of Fame
echo [%s5%] About BMMO
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
if "%msplash%"=="y" echo Use W,S To Navigate, D To Select
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto start
if "%select%"=="2" set select=1&goto news
if "%select%"=="3" set select=1&goto credits
if "%select%"=="4" set select=1&goto hof
if "%select%"=="5" set select=1&goto about
)
goto startgame

:start
START C:gamedata\rpg.bat
goto startgame

:credits
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO Credits
echo ---------------------------------------
echo.
echo Coding -
echo Foox
echo.
echo Ideas -
echo Foox   E EMchammer
echo.
echo Coding Languge -
echo Windows Batch Script
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto startgame
)
goto credits

:about
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo BeyondMMO About
echo ---------------------------------------
echo.
echo BeyondMMO is a small project for
echo me. I don't wan't to make any
echo money off of this. I enjoy making
echo theese command prompt games but
echo I was not at all good at it so
echo here I am making my drean game!
echo.
echo This rpg when it's done will
echo have lot's of cool features
echo but I won't spoil it for you!
echo If you have any suggestions
echo please tell me. Have a good day!
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto startgame
)
goto about

:news
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO News
echo ---------------------------------------
echo.
echo Beta Test Release Is Now Out!
echo Hop into this command prompt
echo style game and climb the
echo latter of victory!
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto startgame
)
goto news

:hof
cls
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO hall Of Fame
echo ---------------------------------------
echo.
echo [%s1%] Austin Lord
echo.
echo [%s2%] Brandon
echo.
echo [%s3%] Garick/Goolosh
echo.
echo [%s4%] Ace
echo.
echo ---------------------------------------
echo [%s5%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto austin
if "%select%"=="2" set select=1&goto brandon
if "%select%"=="3" set select=1&goto garick
if "%select%"=="4" set select=1&goto ace
if "%select%"=="5" set select=1&goto startgame
)
goto hof

:austin
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO hall Of Fame - Austin Lord
echo ---------------------------------------
echo.
echo Just some random person that draws
echo scary cats for a living... But he kool.
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto hof
)
goto austin

:brandon
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO hall Of Fame - Brandon
echo ---------------------------------------
echo.
echo Some minecraft loving kerby boi
echo that chuk purple meatball
echo at floor. Pizzzzza.
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto hof
)
goto brandon

:garick
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO hall Of Fame - Garick/Goolosh
echo ---------------------------------------
echo.
echo Some humman that will make
echo kool joke and can fall into
echo tree real hard. hehe.
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto hof
)
goto garick

:ace
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo BeyondMMO hall Of Fame - Ace
echo ---------------------------------------
echo.
echo Some old frend form like 3rd grade.
echo Will atak on sight.
echo.
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto hof
)
goto ace
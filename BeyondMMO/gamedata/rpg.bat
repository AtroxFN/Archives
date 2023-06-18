@echo off
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

// MARK: Starting Menu
:startgame
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo --------------------------------
echo Welcome to BeyondMMO.
echo --------------------------------
echo Current Version: v1.0 Beta_Test
echo What would you like to do?
echo.
echo [%s1%] New Save
echo [%s2%] Load Save
echo [%s3%] Controls
echo.
echo --------------------------------
echo [%s4%] Exit
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto createuser
if "%select%"=="2" set select=1&goto login2
if "%select%"=="3" set select=1&goto controls
if "%select%"=="4" exit
)
goto startgame
:controls
cls
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=@
echo --------------------------------
echo Controls 
echo --------------------------------
echo.
echo [%s1%] Up: W
echo [%s2%] Down: S
echo [%s3%] Select: D
echo [%s4%] Inv: I
echo [%s5%] Menu: M
echo.
echo --------------------------------
echo [%s6%] Back
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto controls
if "%select%"=="2" set select=2&goto controls
if "%select%"=="3" set select=3&goto controls
if "%select%"=="4" set select=4&goto controls
if "%select%"=="5" set set select=5&goto controls
if "%select%"=="6" set select=1&goto startgame
)
goto controls

:createuser
cls
echo --------------------------------
echo What would you like your Save Name to be?
echo Make sure it's somthing you will
echo remember!
echo --------------------------------
echo.
set /p username1=^> 
if not defined username1 (
goto createuser
)
if %username1% EQU exit goto startgame
:checkforspaces
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" EQU " " (
echo.
echo.
echo Sorry you cant use spaces in your Save Name.
echo.
pause>nul
goto createuser
)
if NOT "!Letter%v1f%!" EQU "" (
set /a v1f=%v1f%+1
goto checkforspaces
)
echo --------------------------------
echo What would you like your Save Password to be?
echo Make sure it's somthing you will
echo remember!
echo --------------------------------
echo.
set /p password1=^> 
if not defined password1 (
goto checkforspaces
)
if %password1% EQU exit goto startgame
echo SAVE CREATED
pause>nul
goto DATA_VALUES


:login2
cls
echo --------------------------------
echo LOAD SAVE - NAME
echo --------------------------------
echo What was your saves name?
echo.
set /p name1=^> 
if not defined name1 (
goto login2
)
if %name1% EQU exit goto startgame
if not exist "C:gamedata\users\%name1%\%name1%.savegame" (
echo CorruptedER A VALID SAVE
pause>nul
goto login2
)
cls
echo --------------------------------
echo LOAD SAVE - PASSWORD
echo --------------------------------
echo what was your saves password?
echo.
set /p pass1=^> 
if not defined pass1 (
goto login2
)
if %pass1% EQU exit goto startgame
< C:gamedata\users\%name1%\%name1%.savegame (
set /p username1=
set /p password1=
set /p dmgnpc=0
set /p xpuntil=800
set /p hp=100
set /p orighp=100
set /p damage=0
set /p swordchoice=hi
set /p swordtype=Your
set /p armortype=N/A
set /p levell=1
set /p playerxp=0
set /p skind=hand
set /p skindA=N/A
set /p dr=0
set /p armtype=No 
set /p runes=50
set /p sword1=0
set /p sword2=0
set /p sword3=0
set /p sword4=0
set /p sword5=0
set /p sword6=0
set /p sword7=0
set /p sword8=0
set /p armor1=0
set /p armor2=0
set /p armor3=0
set /p armor4=0
set /p armor5=0
set /p armor6=0
set /p armor7=0
set /p armor8=0
set /p dchest=0
set /p gmail=0
set /p clegs=0
set /p bufflegs=0
set /p bfp=0
set /p dbrain=0
set /p skin=0
set /p seeds=0
set /p fins=0
set /p cshard=0
set /p rocks=0
set /p ocoins=0
set /p bobst=0
set /p fangs=0
set /p pelt=0
set /p pelt2=0
set /p zombief=0
set /p potiont1=3
set /p potiont2=0
set /p potiont3=0
set /p damage=0
set /p gcho=--
set /p cost=--
set /p Woodcuttingmaxxp=500
set /p Woodcuttinglvl=0
set /p Woodcuttingxpleft=500
set /p Woodcuttingcurxp=0
set /p miningmaxxp=500
set /p mininglvl=0
set /p miningxpleft=500
set /p miningcurxp=0
set /p ttlvl=0
set /p qc1=0
set /p campname=%username1%'s Camp
)
if not %password1% EQU %pass1% (
echo VALID PASSWORD
pause>nul
goto login2
)
:loginSUCCESS
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo --------------------------------
echo SUCCESSFULLY LOADED SAVE FILE
echo --------------------------------
echo We hope you have fun playing
echo BeyondMMO!
echo.
echo --------------------------------
echo [%s1%] Okay
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto MENU
)
goto loginSUCCESS


:DATA_VALUES
set dmgnpc=0
set xpuntil=800
set hp=100
set orighp=100
set damage=0
set swordchoice=hi
set swordtype=Your
set armortype=N/A
set levell=1
set playerxp=0
set skind=hand
set skindA=N/A
set dr=0
set armtype=No 
set runes=50
set sword1=0
set sword2=0
set sword3=0
set sword4=0
set sword5=0
set sword6=0
set sword7=0
set sword8=0
set armor1=0
set armor2=0
set armor3=0
set armor4=0
set armor5=0
set armor6=0
set armor7=0
set armor8=0
set dchest=0
set gmail=0
set clegs=0
set bufflegs=0
set bfp=0
set dbrain=0
set skin=0
set seeds=0
set fins=0
set cshard=0
set rocks=0
set ocoins=0
set bobst=0
set fangs=0
set pelt=0
set pelt2=0
set zombief=0
set potiont1=3
set potiont2=0
set potiont3=0
set damage=0
set gcho=--
set cost=--
set Woodcuttingmaxxp=500
set Woodcuttinglvl=1
set Woodcuttingxpleft=500
set Woodcuttingcurxp=0
set miningmaxxp=500
set mininglvl=0
set miningxpleft=500
set miningcurxp=0
set ttlvl=0
set qc1=0
set campname=%username1%'s Camp

set journal=empty
goto SAVE_GAME_FILES2


:SAVE_GAME_FILES2
md C:gamedata\users\%username1%
(
echo %username1%
echo %password1%
echo %dmgnpc%
echo %xpuntil%
echo %hp%
echo %orighp%
echo %damage%
echo %swordchoice%
echo %swordtype%
echo %armortype%
echo %levell%
echo %playerxp%
echo %skind%
echo %skindA%
echo %dr%
echo %armtype%
echo %runes%
echo %sword1%
echo %sword2%
echo %sword3%
echo %sword4%
echo %sword5%
echo %sword6%
echo %sword7%
echo %sword8%
echo %armor1%
echo %armor2%
echo %armor3%
echo %armor4%
echo %armor5%
echo %armor6%
echo %armor7%
echo %armor8%
echo %dchest%
echo %gmail%
echo %clegs%
echo %bufflegs%
echo %bfp%
echo %dbrain%
echo %skin%
echo %seeds%
echo %fins%
echo %cshard%
echo %rocks%
echo %ocoins%
echo %bobst%
echo %fangs%
echo %pelt%
echo %pelt2%
echo %zombief%
echo %potiont1%
echo %potiont2%
echo %potiont3%
echo %damage%
echo %gcho%
echo %cost%
echo %Woodcuttingmaxxp%
echo %Woodcuttinglvl%
echo %Woodcuttingxpleft%
echo %Woodcuttingcurxp%
echo %miningmaxxp%
echo %mininglvl%
echo %miningxpleft%
echo %miningcurxp%
echo %ttlvl%
echo %qc1%
echo %campname%
) > C:gamedata\users\%username1%\%username1%.savegame
(
echo %journal%
) > C:gamedata\users\%username1%\journal.data
goto MENU

:SAVE_GAME_FILES
(
echo %username1%
echo %password1%
echo %dmgnpc%
echo %xpuntil%
echo %hp%
echo %orighp%
echo %damage%
echo %swordchoice%
echo %swordtype%
echo %armortype%
echo %levell%
echo %playerxp%
echo %skind%
echo %skindA%
echo %dr%
echo %armtype%
echo %runes%
echo %sword1%
echo %sword2%
echo %sword3%
echo %sword4%
echo %sword5%
echo %sword6%
echo %sword7%
echo %sword8%
echo %armor1%
echo %armor2%
echo %armor3%
echo %armor4%
echo %armor5%
echo %armor6%
echo %armor7%
echo %armor8%
echo %dchest%
echo %gmail%
echo %clegs%
echo %bufflegs%
echo %bfp%
echo %dbrain%
echo %skin%
echo %seeds%
echo %fins%
echo %cshard%
echo %rocks%
echo %ocoins%
echo %bobst%
echo %fangs%
echo %pelt%
echo %pelt2%
echo %zombief%
echo %potiont1%
echo %potiont2%
echo %potiont3%
echo %damage%
echo %gcho%
echo %cost%
echo %Woodcuttingmaxxp%
echo %Woodcuttinglvl%
echo %Woodcuttingxpleft%
echo %Woodcuttingcurxp%
echo %miningmaxxp%
echo %mininglvl%
echo %miningxpleft%
echo %miningcurxp%
echo %ttlvl%
echo %qc1%
echo %campname%
) > C:gamedata\users\%username1%\%username1%.savegame
goto %destination%

// MARK: Camp
:MENU
set destination=MENU
cls
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=@
echo --------------------------------
echo %campname%
echo --------------------------------
echo.
echo [%s1%] Map
echo [%s2%] Weapon Store
echo [%s3%] Armor Store
echo [%s4%] Alchemy Stand
echo [%s5%] Inventory
echo [%s6%] The Workshop
echo.
echo --------------------------------
echo Curently On Save: %username1%
echo --------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto map1
if "%select%"=="2" set select=1&goto weaponstore1
if "%select%"=="3" set select=1&goto armorstore1
if "%select%"=="4" set select=1&goto potionshop
if "%select%"=="5" set select=1&goto selectbag
if "%select%"=="6" set select=1&goto workshop
)
goto MENU
:settings
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo --------------------------------
echo GAME SETTINGS
echo --------------------------------
echo.
echo [%s1%] Command Console
echo [%s2%] DLC Manager
echo [%s3%] Change Camp Name
echo.
echo --------------------------------
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto cmdpre
if "%select%"=="2" set select=1&goto dlc
if "%select%"=="3" set select=1&goto renamecamp
if "%select%"=="4" set select=1&goto mainmenu
)
goto settings

:dlc
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo --------------------------------
echo GAME SETTINGS - DLC
echo --------------------------------
echo.
echo [%s1%] Money-Pak
echo.
echo --------------------------------
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto dlc1
if "%select%"=="2" set select=1&goto settings
)
goto dlc

:dlc1
if not exist "C:gamedata\data\dlc\money-pak.dlc" (
echo This Dlc Dose Not Exist In Your Dlc Folder.
pause>nul
goto dlc
)
< C:gamedata\data\dlc\money-pak.dlc (
set /p dlcID=
set /p validID=
)
if not %dlcID% EQU D4xp9Sb2-27jDi99Bd9 (
echo INVALID DLC
pause>nul
goto dlc
)
if not %validID% EQU 274928374892728492829937 (
echo INVALID DLC
pause>nul
goto dlc
)
set /a runes=%runes%+1000
goto dlc




:renamecamp
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo --------------------------------
echo Camp Name Changer
echo --------------------------------
echo.
echo What Would You Like To Name Your Camp?
set /p nc=^> 
if not defined nc (
goto renamecamp
)
set campname=%nc%
echo Done! %nc% is now your camp name
echo [%s1%] Okay
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto mainmenu
)
goto renamecamp

:color
title RPG - Settings - Color Change
cls
echo.
echo What would you like to change the color to?
echo.
echo Background                  Text
echo.
echo 0 = Black		8 = Gray
echo 1 = Blue 		9 = Light Blue
echo 2 = Green 		A = Light Green
echo 3 = Aqua 		B = Light Aqua
echo 4 = Red 		C = Light Red
echo 5 = Purple 		D = Light Purple
echo 6 = Yellow 		E = Light Yellow
echo 7 = White 		F = Bright White
echo.
echo Type the color combination you would like.
echo (example: 0f)
echo.
echo Type "9" To Exit.
set /p colorcho=">"
if not defined colorcho (
goto color
)
if %colorcho% EQU 9 goto settings
color %colorcho%
goto color

:cmdpre
cls
echo --------------------------------
echo To Enter the command consle you need
echo To Enter an admin cmd accses code.
echo --------------------------------
set /p cmdpre=^> 
if not defined cmdpre (
goto cmdpre
)
if %cmdpre% EQU password-3301-763301 goto cmda
if %cmdpre% EQU exit goto settings
goto cmdpre

:cmda
cls
:cmdb
echo Type "help" for a list of commands.
echo -----------------------
set /p cmd=C:\Admin\%username1%">"
if not defined cmd (
goto cmda
)
if %cmd% EQU help goto help
if %cmd% EQU exit goto settings
if %cmd% EQU give_runes goto ammountm1
goto cmda

:ammountm1
echo what ammount would you like?
set /p cmd2=C:\Admin\%username1%">"
if not defined cmd2 (
goto ammountm1
)
set /a runes=%cmd2%
goto cmda
:help
echo RPG Commnd Consle Help.
echo ---------------------------------------
echo give [Item] [ammount] = Gives an item of any ammount.
echo level give [ammount] = Gives any ammount of levels.
echo give_runes = Give any ammount of runes
echo exit = exits you out of the cmd.
echo.
echo.
echo.
pause>nul
goto cmd2

// MARK: Sand Beach
:picknpc
set destination=picknpc
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Crab
if %npc% EQU 3 set npctype=Buff-Lobster
if %npc% EQU 4 set npctype=Fisherman
if %npc% EQU 5 set npctype=Dave
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Land-Fish
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Theif
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat

:BATTLE_VARIABLES
set destination=BATTLE_VARIABLES
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START )
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START )
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START )
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START )
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START )
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START )
if %levell% LEQ 37 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START )


:F_START
set destination=F_START
cls
echo.
echo You are wandering the floor
echo.
ping localhost -n 2 >nul
echo You encounter a level %levell% %npctype%.
ping localhost -n 2 >nul
goto fs1


:fs1
set destination=fs1
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo ---------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo ---------------------------------------
echo What would you like to do?
echo.
echo [%s1%] Attack
echo [%s2%] Flee
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk
if "%select%"=="2" set select=1&goto flee
)
goto fs1


:atk
set destination=atk
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Strong set /a damage=%random%*180/32767+1
if %swordtype% EQU Gold set /a damage=%random%*230/32767+1
if %swordtype% EQU Masters set /a damage=%random%*280/32767+1
if %swordtype% EQU Flying set /a damage=%random%*310/32767+1
if %swordtype% EQU Masters set /a damage=%random%*325/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
echo ---------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo ---------------------------------------
echo.
echo You attacked!
echo.
echo ---------------------------------------
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*3)
set /a playerxp=%playerxp%+%atkxp%
set /a xpuntil=%xpuntil%-%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npctype%^^!
echo.
echo It now has %health% health left.
echo.
echo You gain %playerxp% EXP.
pause>nul
if %levell% GEQ 37 set /a xpuntil=1
if %playerxp% GEQ 1000000 set /a playerxp=1000000
if %health% LEQ 0 goto checkiflvlup
if %xpuntil% LEQ 0 goto levelup
goto fs3


:fs3
set destination=fs3
if %npctype% EQU Rat set /a dmgnpc=%random%*23/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Crab set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Buff-Lobster set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Fisherman set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Dave set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Land-Fish set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*111/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Theif set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*360/32767+1
if %armtype% EQU Cloth set /a dr=%random%*10/32767+1
if %armtype% EQU Chain set /a dr=%random%*20/32767+1
if %armtype% EQU Bronze set /a dr=%random%*40/32767+1
if %armtype% EQU Iron set /a dr=%random%*65/32767+1
if %armtype% EQU Steel set /a dr=%random%*100/32767+1
if %armtype% EQU Gold set /a dr=%random%*120/32767+1
if %armtype% EQU Crystal set /a dr=%random%*145/32767+1
if %armtype% EQU Sacred set /a dr=%random%*175/32767+1
if %armtype% EQU Runic set /a dr=%random%*200/32767+1
if %armtype% EQU Infernal set /a dr=%random%*215/32767+1
if %armtype% EQU Omega set /a dr=%random%*230/32767+1
if %armtype% EQU Chaotic set /a dr=%random%*250/32767+1
if %armtype% EQU Mythical set /a dr=%random%*275/32767+1
if %armtype% EQU Alydril set /a dr=%random%*300/32767+1
if %armtype% EQU Cloth set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chain set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Bronze set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Iron set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Steel set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Gold set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Crystal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Sacred set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Runic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Infernal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Omega set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chaotic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Mythical set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Alydril set /a dmgnpc=%dmgnpc%-%dr%
if %dmgnpc% LEQ 0 set /a dmgnpc=0

cls
echo ---------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo --------------------------------------
echo.
echo The %npctype% attacks.
echo.
echo ---------------------------------------
ping localhost -n 2 >nul
echo The %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo You now have %hp% health left.
pause>nul
if %xpuntil% LEQ 0 goto levelup
goto fs1


:checkiflvlup
set destination=checkiflvlup
if %xpuntil% LEQ 0 goto levelup



:dropitem
set destination=dropitem
if %npctype% EQU Goblin goto goblindrop
if %npctype% EQU Crab goto Crabdrop
if %npctype% EQU Buff-Lobster goto Buff-Lobsterdrop
if %npctype% EQU Fisherman goto Fishermandrop
if %npctype% EQU Dave goto Davedrop
if %npctype% EQU Human goto humandrop
if %npctype% EQU Farmer goto farmerdrop
if %npctype% EQU Land-Fish goto Land-Fishdrop
if %npctype% EQU Boulder goto Boulderdrop
if %npctype% EQU Corrupted goto Corrupteddrop
if %npctype% EQU Theif goto theifdrop
if %npctype% EQU Bob goto Bobdrop
if %npctype% EQU Rat goto Land-Fishdrop

::set /a gmail=%gmail%+1
:goblindrop
set destination=golbindrop
set word=1
set drop=Goblin Mail
set /a gmail=%gmail%+1
set /a runes=%runes%+3
goto win

:Crabdrop
set destination=Crabdrop
set word=3
set drop=Crab Legs
set /a clegs=%clegs%+3
set /a runes=%runes%+2
set /a qc1=%qc1%+1
goto win

:Buff-Lobsterdrop
set destination=Buff-Lobsterdrop
set word=1
set drop=Buff-Lobster Claws
set /a bufflegs=%bufflegs%+1
set /a runes=%runes%+5
goto win

:Fishermandrop
set destination=Fishermandrop
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a runes=%runes%+3
goto win

:Davedrop
set destination=Davedrop
set word=1
set drop=Dave Brin fragment
set /a dbrain=%dbrain%+1
set /a runes=%runes%+7
goto win

:humandrop
set destination=humandrop
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a runes=%runes%+5
goto win

:farmerdrop
set destination=farmerdrop
set word=3
set drop=Seeds
set /a seeds=%seeds%+3
set /a runes=%runes%+1
goto win

:Land-Fishdrop
set destination=Land-Fishdrop
set word=1
set drop=Fish Fins
set /a fins=%fins%+1
set /a runes=%runes%+2
goto win

:Boulderdrop
set destination=Boulderdrop
set word=3
set drop=Rocks
set /a rocks=%rocks%+3
set /a runes=%runes%+7
goto win

:Corrupteddrop
set destination=Corrupteddrop
set word=1
set drop=Corrupted Shard
set /a cshard=%cshard%+1
set /a runes=%runes%+10
goto win

:theifdrop
set destination=theifdrop
set word=2
set drop=Old Coins
set /a ocoins=%ocoins%+2
set /a runes=%runes%+25
goto win

:Bobdrop
set destination=Bobdrop
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a runes=%runes%+50
goto win


:levelup
set destination=levelup
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a xpuntil=%xpuntil%+%origxp%
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a runes=%runes%+85
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have leveled up! You are now level %levell%.
echo ---------------------------------------
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto MENU
)
goto levelup


:win
set destination=win
set /a hp=%orighp%
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo Congrats Adventurer!
echo ---------------------------------------
echo.
echo You won the battle against the %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto MENU
)
goto win

:die
set destination=die
set /a killcount=0
set /a hp=%orighp%
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You died... Another one bites the dust...
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto MENU
)
goto die

:flee
set destination=flee
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You flee from the battle... Coward.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto MENU
)
goto flee

:map1
set destination=map1
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo Map Of Olex
echo ---------------------------------------
echo.
echo [%s1%] Dungeons
echo [%s2%] Towns
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto map2
if "%select%"=="2" set select=1&goto map3
if "%select%"=="3" set select=1&goto MENU
)
goto map1

:map2
set destination=map2
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo Map Of Dunegons
echo ---------------------------------------
echo.
echo [%s1%] Sand Beach Lv.1
echo [%s2%] Creepy Crypt Lv.10
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto picknpc
if "%select%"=="2" set select=1&goto testlvl
if "%select%"=="3" set select=1&goto map1
)
goto map2

:map3
set destination=map3
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo ---------------------------------------
echo Map Of Towns
echo ---------------------------------------
echo.
echo [%s1%] Sylv Lv.5
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto testlvl2
if "%select%"=="2" set select=1&goto map1
)
goto map3

:testlvl2
set destination=testlvl2
if not %levell% LEQ 5 goto town1
echo You are not high enough level
echo to go there...
pause>nul
goto map3

:testlvl
set destination=testlvl
if not %levell% LEQ 10 goto picknpc2
echo You are not high enough level
echo to go there...
pause>nul
goto map2

:selectbag
set destination=selectbag
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo %username1%'s Stats
echo ---------------------------------------
echo Health: %hp%\%orginhp%
echo Level: %levell%
echo Total Level: %ttlvl%
echo Runes: %runes%
echo EXP: %playerxp%
echo EXP Until Level: %xpuntil%
echo Weapon: %swordtype% %skind%
echo Armor: %armortype% %skindA%
echo ---------------------------------------
echo Select Bag.
echo ---------------------------------------
echo.
echo [%s1%] Backpack
echo [%s2%] Material Pouch
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
if "%select%"=="2" set select=1&goto checkitemsP2
if "%select%"=="3" set select=1&goto MENU
)
goto selectbag



:checkitems
set destination=checkitems
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo ---------------------------------------
echo %username1%'s Backpack.
echo ---------------------------------------
echo.
if %potiont1% GTR 0 echo Health Potion T1 - 25: %potiont1%
if %potiont2% GTR 0 echo Health Potion T2 - 50: %potiont2%
if %potiont3% GTR 0 echo Health Potion T3 - 100: %potiont3%
if %dchest% GTR 0 echo Dungeon Chest T1: %dchest%
echo.
if %sword1% GTR 0 echo Plastic Sword: %sword1%
if %sword2% GTR 0 echo Old Dagger: %sword2%
if %sword3% GTR 0 echo Refurbished Glave: %sword3%
if %sword4% GTR 0 echo Strong Staff: %sword4%
if %sword5% GTR 0 echo Gold Shank: %sword5%
if %sword6% GTR 0 echo Masters Katana: %sword6%
if %sword7% GTR 0 echo Flying Dagger: %sword7%
if %sword8% GTR 0 echo Masters Staff: %sword8%
echo.
if %armor1% GTR 0 echo Cardbord Plate: %armor1%
if %armor2% GTR 0 echo ^*Creative Amror Name^*: %armor2%
if %armor3% GTR 0 echo Steel Boots: %armor3%
if %armor4% GTR 0 echo Cosmic Helmet: %armor4%
if %armor5% GTR 0 echo Furr Suit: %armor5%
if %armor6% GTR 0 echo Titanium Armor: %armor6%
if %armor7% GTR 0 echo Cosmic ^Set: %armor7%
if %armor8% GTR 0 echo Armor #168-2: %armor8%
echo.
echo ---------------------------------------
echo.
echo [%s1%] Heal
echo [%s2%] Change Weapon
echo [%s3%] Change Armor
echo.
echo Page: ^1
echo ---------------------------------------
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto healmenu
if "%select%"=="2" set select=1&goto weaponselect
if "%select%"=="3" set select=1&goto armorselect
if "%select%"=="4" set select=1&goto selectbag
)
goto checkitems

:checkitemsP2
set destination=checkitemsP2
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %username1%'s Material Pouch.
echo ---------------------------------------
echo.
if %gmail% GTR 0 echo Goblin Mail: %gmail%
if %clegs% GTR 0 echo Crab Legs: %clegs%
if %bufflegs% GTR 0 echo Buff-Lobster Legs: %bufflegs%
if %bfp% GTR 0 echo Broken Fishing Pole: %bfp%
if %dbrain% GTR 0 echo Dave Brain Fragment: %dbrain%
if %skin% GTR 0 echo Human Skin: %skin%
if %seeds% GTR 0 echo Seeds: %seeds%
if %fins% GTR 0 echo Fish Fins: %fins%
if %rocks% GTR 0 echo Rocks: %rocks%
if %cshard% GTR 0 echo Corrupted Shards: %cshard%
if %ocoins% GTR 0 echo Old Coins: %ocoins%
if %bobst% GTR 0 echo Bobs Tear: %bobst%
if %fangs% GTR 0 echo Spider Fnags: %fangs%
if %pelt2% GTR 0 echo Pelt: %pelt2%
if %pelt% GTR 0 echo Mutant Pelt: %pelt%
if %zombief% GTR 0 echo Mutant Pelt: %zombief%
echo.
echo ---------------------------------------
echo Page: ^2
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto selectbag
)
goto checkitemsP2

:checkitemsP3
set destination=checkitemsP3
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
echo %username1%'s Invertory.
echo ---------------------------------------
echo Health: %hp%\%orginhp%
echo Level: %levell%
echo Total Level: %ttlvl%
echo Runes: %runes%
echo EXP: %playerxp%
echo EXP Until Level: %xpuntil%
echo Weapon: %swordtype% %skind%
echo Armor: %armortype% %skindA%
echo ---------------------------------------
echo Armor:
if %armor1% GTR 0 echo Cardbord Plate: %armor1%
if %armor2% GTR 0 echo ^*Creative Amror Name^*: %armor2%
if %armor3% GTR 0 echo Steel Boots: %armor3%
if %armor4% GTR 0 echo Cosmic Helmet: %armor4%
if %armor5% GTR 0 echo Furr Suit: %armor5%
if %armor6% GTR 0 echo Titanium Armor: %armor6%
if %armor7% GTR 0 echo Cosmic ^Set: %armor7%
if %armor8% GTR 0 echo Armor #168-2: %armor8%
echo ---------------------------------------
echo.
echo [%s1%] Last Page
echo [%s2%] Heal
echo [%s3%] Change Weapon
echo [%s4%] Change Armor
echo.
echo Page: ^3
echo ---------------------------------------
echo [%s5%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitemsP2
if "%select%"=="2" set select=1&goto healmenu
if "%select%"=="3" set select=1&goto weaponselect
if "%select%"=="4" set select=1&goto armorselect
if "%select%"=="5" set select=1&goto MENU
)
goto checkitemsP3






:weaponselect
set destination=weaponselect
set destination=weaponselect
set /a numswords=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo ---------------------------------------
echo You currently have a %swordtype% %skind% equipped.
echo ---------------------------------------
echo Select a sword to equip.
echo.
echo [%s1%] Plastic Sword: %sword1%
echo [%s2%] Old Dagger: %sword2%
echo [%s3%] Refurbished Glave: %sword3%
echo [%s4%] Strong Staff: %sword4%
echo [%s5%] Gold Shank: %sword5%
echo [%s6%] Masters Katana: %sword6%
echo [%s7%] Flying Dagger: %sword7%
echo [%s8%] Masters Staff: %sword8%
echo.
echo ---------------------------------------
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto equips1
if "%select%"=="2" set select=1&goto equips2
if "%select%"=="3" set select=1&goto equips3
if "%select%"=="4" set select=1&goto equips4
if "%select%"=="5" set select=1&goto equips5
if "%select%"=="6" set select=1&goto equips6
if "%select%"=="7" set select=1&goto equips7
if "%select%"=="8" set select=1&goto equips8
if "%select%"=="9" set select=1&goto checkitems
)
goto weaponselect

:equips1
set destination=equips1
if %sword1% EQU 0 goto nosword
if %swordtype% EQU Plastic goto alreadyequip
set swordtype=Plastic
set skind=Sword
set aan=a
goto confirmequip

:equips2
set destination=equips2
if %sword2% EQU 0 goto nosword
if %swordtype% EQU Old goto alreadyequip
set swordtype=Old
set skind=Dagger
set aan=a
goto confirmequip

:equips3
set destination=equips3
if %sword3% EQU 0 goto nosword
if %swordtype% EQU Refurbished goto alreadyequip
set swordtype=Refurbished
set skind=Glave
set aan=a
goto confirmequip

:equips4
set destination=equips4
if %sword4% EQU 0 goto nosword
if %swordtype% EQU Strong goto alreadyequip
set swordtype=Strong
set skind=Staff
set aan=a
goto confirmequip

:equips5
set destination=equips5
if %sword5% EQU 0 goto nosword
if %swordtype% EQU Gold goto alreadyequip
set swordtype=Gold
set skind=Shank
set aan=a
goto confirmequip

:equips6
set destination=equips6
if %sword6% EQU 0 goto nosword
if %swordtype% EQU Masters goto alreadyequip
set swordtype=Masters
set skind=Katana
set aan=a
goto confirmequip

:equips7
set destination=equips7
if %sword7% EQU 0 goto nosword
if %swordtype% EQU Flying goto alreadyequip
set swordtype=Flying
set skind=Dagger
set aan=a
goto confirmequip

:equips8
set destination=equips8
if %sword8% EQU 0 goto nosword
if %swordtype% EQU Masters goto alreadyequip
set swordtype=Masters
set skind=Staff
set aan=a
goto confirmequip

:confirmequip
set destination=confirmequip
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have equipped %aan% %swordtype% %skind%.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto confirmequip

:nosword
set destination=nosword
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have that weapon.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto nosword


:alreadyequip
set destination=alreadyequip
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You already have that weapon equipped.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto alreadyequip

:armorselect
set destination=armorselect
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo ---------------------------------------
echo You currentlyly have a %armortype% %skindA% equipped.
echo ---------------------------------------
echo Select a sword to equip.
echo.
echo [%s1%] Cardbord Plate: %armor1%
echo [%s2%] ^*Creative Armor Name*^: %armor2%
echo [%s3%] Steel Boots: %armor3%
echo [%s4%] Cosmic Helmet: %armor4%
echo [%s5%] Furr Suit: %armor5%
echo [%s6%] Titanium Armor: %armor6%
echo [%s7%] Cosmic ^Set: %armor7%
echo [%s8%] Armor #168-2 %armor8%
echo.
echo ---------------------------------------
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto equips1A
if "%select%"=="2" set select=1&goto equips2A
if "%select%"=="3" set select=1&goto equips3A
if "%select%"=="4" set select=1&goto equips4A
if "%select%"=="5" set select=1&goto equips5A
if "%select%"=="6" set select=1&goto equips6A
if "%select%"=="7" set select=1&goto equips7A
if "%select%"=="8" set select=1&goto equips8A
if "%select%"=="9" set select=1&goto checkitems
)
goto armorselect

:equips1A
set destination=equips1A
if %armor1% EQU 0 goto noarmorA
if %armortype% EQU Cardbord goto alreadyequipA
set armortype=Cardbord
set skindA=Plate
set aan=a
goto confirmequipA

:equips2A
set destination=equips2A
if %armor2% EQU 0 goto noarmorA
if %armortype% EQU Creative goto alreadyequipA
set armortype=Creative
set skindA=Name
set aan=a
goto confirmequipA

:equips3A
set destination=equips3A
if %armor3% EQU 0 goto noarmorA
if %armortype% EQU Steel goto alreadyequipA
set armortype=Steel
set skindA=Boots
set aan=a
goto confirmequipA

:equips4A
set destination=equips4A
if %armor4% EQU 0 goto noarmorA
if %armortype% EQU Cosmic goto alreadyequipA
set armortype=Cosmic
set skindA=Helmet
set aan=a
goto confirmequipA

:equips5A
set destination=equips5A
if %armor5% EQU 0 goto noarmorA
if %armortype% EQU Furr goto alreadyequipA
set armortype=Furr
set skindA=Suit
set aan=a
goto confirmequipA

:equips6A
set destination=equips6A
if %armor6% EQU 0 goto noarmorA
if %armortype% EQU Titanium goto alreadyequipA
set armortype=Titanium
set skindA=Armor
set aan=a
goto confirmequipA

:equips7A
set destination=equips7A
if %armor7% EQU 0 goto noarmorA
if %armortype% EQU Set goto alreadyequipA
set armortype=Cosmic
set skindA=Set
set aan=a
goto confirmequipA

:equips8A
set destination=equips8A
if %armor8% EQU 0 goto noarmorA
if %armortype% EQU Armor goto alreadyequipA
set armortype=Armor
set skindA=#168-2
set aan=a
goto confirmequipA

:confirmequipA
set destination=confirmequipA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have equipped %aan% %armortype% %skindA%.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto confirmequipA

:noarmorA
set destination=noarmorA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have that armor.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto noarmorA


:alreadyequipA
set destination=alreadyequipA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You already have that armor equipped.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto alreadyequipA

:healmenu
set destination=healmenu
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo ---------------------------------------
echo Health Potion Selection.
echo ---------------------------------------
echo.
echo [%s1%] Health Potion T1 - 25: %potiont1%
echo [%s2%] Health Potion T2 - 50: %potiont2%
echo [%s3%] Health Potion T3 - 100: %potiont3%
echo.
echo ---------------------------------------
echo [%s4%] Back
echo Please choose a potion to use.
echo.
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto heal1
if "%select%"=="2" set select=1&goto heal2
if "%select%"=="3" set select=1&goto heal3
if "%select%"=="4" set select=1&goto checkitems
)
goto healmenu

:heal1
set destination=heal1
if %hp% EQU %orginhp% Goto healmenu
if %potiont1% LSS 1 goto howugh?
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have been healed by 25 Hp.
echo ---------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto heal1


:heal2
set destination=heal2
if %hp% EQU %orginhp% Goto healmenu
if %potiont1% LSS 1 goto howugh?
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have been healed by 50 Hp.
echo ---------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto heal2

:heal3
set destination=heal3
if %hp% EQU %orginhp% Goto healmenu
if %potiont1% LSS 1 goto howugh?
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have been healed by 100 Hp.
echo ---------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto heal3

:howugh
set destination=howugh
echo ???
echo ------------
echo How did you get here?
echo O-O?
pause>nul
goto healmenu

// MARK: Weapon Store
:weaponstore1
set destination=weaponstore1
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo ---------------------------------------
echo You Curently Have %runes% Runes.
echo ---------------------------------------
echo.
echo [%s1%] Plastic Sword - 50 Runes
echo [%s2%] Old Dagger - 115 Runes
echo [%s3%] Refurbished Glave - 380 Runes
echo [%s4%] Strong Staff - 800 Runes
echo [%s5%] Gold Shank - 1,200 Runes
echo [%s6%] Masters Katana - 1,815 Runes
echo [%s7%] Flying Dagger - 2,000 Runes
echo [%s8%] Masters Staff - 2,300 Runes
echo.
echo Weapon Store Pg.1
echo ---------------------------------------
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="9" set select=1&goto MENU
if "%select%"=="1" set select=1& (
set /a sprice=50
set swordchoice=Plastic
set swordchoice2=Sword
set /a att=100
set levelneeded=1
goto buyw1 )
if "%select%"=="2" set select=1& (
set /a sprice=115
set swordchoice=Old
set swordchoice2=Dagger
set /a att=118
set levelneeded=1
goto buyw2 )
if "%select%"=="3" set select=1& (
set /a sprice=380
set swordchoice=Refurbished
set swordchoice2=Glave
set /a att=145
set levelneeded=2
goto buyw3 )
if "%select%"=="4" set select=1& (
set /a sprice=800
set swordchoice=Strong
set swordchoice2=Staff
set /a att=180
set levelneeded=5
goto buyw4 )
if "%select%"=="5" set select=1& (
set /a sprice=1,200
set swordchoice=Gold
set swordchoice2=Shank
set /a att=230
set levelneeded=10
goto buyw5 )
if "%select%"=="6" set select=1& (
set /a sprice=1,815
set swordchoice=Masters
set swordchoice2=Katana
set /a att=280
set levelneeded=20
goto buyw6 )
if "%select%"=="7" set select=1& (
set /a sprice=2,000
set swordchoice=Flying
set swordchoice2=Dagger
set /a att=310
set levelneeded=25
goto buyw7 )
if "%select%"=="8" set select=1& (
set /a sprice=2,300
set swordchoice=Masters
set swordchoice2=Staff
set /a att=325
set levelneeded=35
goto buyw8 )
goto buynow
)
goto weaponstore1

:buyw1
set destination=buyw1
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword1=%sword1%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw1

:buyw2
set destination=buyw2
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword2=%sword2%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw2

:buyw3
set destination=buyw3
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword3=%sword3%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw3

:buyw4
set destination=buyw4
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword4=%sword4%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw4

:buyw5
set destination=buyw5
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword5=%sword5%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw5

:buyw6
set destination=buyw6
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword6=%sword6%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw6

:buyw7
set destination=buyw7
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword7=%sword7%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw7

:buyw8
set destination=buyw8
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %runes% LSS %sprice% goto norunes
set /a runes=%runes%-%sprice%
set /a sword8=%sword8%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw8







:norunes
set destination=norunes
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have enough Runes to buy this.
echo ---------------------------------------
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto norunes

:NOTHIGHENOUGHLEVELTOBUY
set destination=NOTHIGHENOUGHLEVELTOBUY
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You are not a high enough level to buy this item.
echo --------------------------------------
echo You need to be at least level %levelneeded%.
echo Come back when you are level %levelneeded%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto NOTHIGHENOUGHLEVELTOBUY

:potionshop
set destination=potionshop
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo ---------------------------------------
echo You CurCorruptedly Have %runes% Runes.
echo ---------------------------------------
echo Alchemy Stand!
echo.
echo [%s1%] Health Potion T1 - 25 Health - 20 Runes
echo [%s2%] Health Potion T2 - 50 Health - 58 Runes
echo [%s3%] Health Potion T3 - 100 Health - 135 Runes
echo.
echo ---------------------------------------
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto buyp1
if "%select%"=="2" set select=1&goto buyp2
if "%select%"=="3" set select=1&goto buyp3
if "%select%"=="4" set select=1&goto MENU
)
goto potionshop

:buyp1
set destination=buyp1
if %runes% LSS 20 goto norunes
set /a runes=%runes%-20
set /a potiont1=%potiont1%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo Health Potion T1 purchased.
echo ---------------------------------------
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp2

:buyp2
set destination=buyp2
if %runes% LSS 58 goto norunes
set /a runes=%runes%-58
set /a potiont2=%potiont2%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo Health Potion T2 purchased.
echo ---------------------------------------
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp2

:buyp3
set destination=buyp3
if %runes% LSS 135 goto norunes
set /a runes=%runes%-135
set /a potiont3=%potiont3%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo Health Potion T3 purchased.
echo ---------------------------------------
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp3


:norunesp
set destination=norunesp
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have enough Runes to buy this.
echo ---------------------------------------
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto potionshop
)
goto norunes

:armorstore1
set destination=armorstore1
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo ---------------------------------------
echo You Curently Have %runes% Runes.
echo ---------------------------------------
echo.
echo [%s1%] Cardbord Plate - 45 Runes
echo [%s2%] ^*Creative Amror Name^* - 135 Runes
echo [%s3%] Steel boots - 380 Runes
echo [%s4%] Cosmic Helmet - 830 Runes
echo [%s5%] Furr Suit - 1,500 Runes
echo [%s6%] Titanium Armor - 2,458 Runes
echo [%s7%] Cosmic ^Set - 2,900 Runes
echo [%s8%] Armor #168-2 - 3,880 Runes
echo.
echo Armor Store Pg.1
echo ---------------------------------------
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1& (
set /a sprice=45
set armorchoice=Cardbord
set armorchoice2=Plate
set /a hpp=25
set levelneeded=1
goto buyw1A )
if "%select%"=="2" set select=1& (
set /a sprice=115
set armorchoice=Creative
set armorchoice2=Name
set /a hpp=45
set levelneeded=1
goto buyw2A )
if "%select%"=="3" set select=1& (
set /a sprice=380
set armorchoice=Steel
set armorchoice2=Boots
set /a hpp=54
set levelneeded=2
goto buyw3A )
if "%select%"=="4" set select=1& (
set /a sprice=830
set armorchoice=Cosmic
set armorchoice2=Helmet
set /a hpp=80
set levelneeded=5
goto buyw4A )
if "%select%"=="5" set select=1& (
set /a sprice=1,500
set armorchoice=Furr
set armorchoice2=Suit
set /a hpp=125
set levelneeded=10
goto buyw5A )
if "%select%"=="6" set select=1& (
set /a sprice=2,458
set armorchoice=Titanium
set armorchoice2=Amror
set /a hpp=225
set levelneeded=20
goto buyw6A )
if "%select%"=="7" set select=1& (
set /a sprice=2,900
set armorchoice=Cosmic
set armorchoice2=Set
set /a hpp=310
set levelneeded=25
goto buyw7A )
if "%select%"=="8" set select=1& (
set /a sprice=3,880
set armorchoice=Armor
set armorchoice2=#168-2
set /a hpp=345
set levelneeded=35
goto buyw8A )
if "%select%"=="9" set select=1&goto MENU
)
goto armorstore1

:buyw1A
set destination=buyw1A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor1=%armor1%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw1A

:buyw2A
set destination=buyw2A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor2=%armor2%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw2A

:buyw3A
set destination=buyw3A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor3=%armor3%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw3A

:buyw4A
set destination=buyw4A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor4=%armor4%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw4A

:buyw5A
set destination=buyw5A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor5=%armor5%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw5A

:buyw6A
set destination=buyw6A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor6=%armor6%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw6A

:buyw7A
set destination=buyw7A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor7=%armor7%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw7A

:buyw8A
set destination=buyw8A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %runes% LSS %sprice% goto norunesA
set /a runes=%runes%-%sprice%
set /a armor8=%armor8%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw8A







:norunesA
set destination=norunesA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have enough Runes to buy this.
echo ---------------------------------------
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto norunesA

:NOTHIGHENOUGHLEVELTOBUYA
set destination=NOTHIGHENOUGHLEVELTOBUYA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You are not a high enough level to buy this item.
echo --------------------------------------
echo You need to be at least level %levelneeded%.
echo Come back when you are level %levelneeded%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto NOTHIGHENOUGHLEVELTOBUYA
// MARK: Creepy Crypt
:picknpc2
set destination=picknpc2
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Giant-Spider
if %npc% EQU 2 set npctype=Mutant-Wolf
if %npc% EQU 3 set npctype=Wolf
if %npc% EQU 4 set npctype=John
if %npc% EQU 5 set npctype=Bear
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Mites
if %npc% EQU 8 set npctype=Zombie-Chiken
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Theif
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat

:BATTLE_VARIABLES2
set destination=BATTLE_VARIABLES2
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START2 )
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START2 )
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START2 )
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START2 )
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START2 )
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START2 )
if %levell% LEQ 37 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START2 )

:F_START2
set destination=F_START2

cls
echo.
echo You are wandering the floor
echo.
ping localhost -n 2 >nul
echo You encounter a level %levell% %npctype%.
ping localhost -n 2 >nul
goto fs1-2


:fs1-2
set destination=fs1-2
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo --------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo --------------------------------------
echo.
echo.
echo What would you like to do?
echo.
echo [%s1%] Attack
echo [%s2%] Flee
echo.
echo ----------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk2
if "%select%"=="2" set select=1&goto flee
)
goto fs1-2


:atk2
set destination=atk2
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Strong set /a damage=%random%*180/32767+1
if %swordtype% EQU Gold set /a damage=%random%*230/32767+1
if %swordtype% EQU Masters set /a damage=%random%*280/32767+1
if %swordtype% EQU Flying set /a damage=%random%*310/32767+1
if %swordtype% EQU Masters set /a damage=%random%*325/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
echo --------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo --------------------------------------
echo.
echo You attack^^!
echo.
ping localhost -n 2 >nul
set /a atk2xp=((%damage%/4)*3)
set /a playerxp=%playerxp%+%atk2xp%
set /a xpuntil=%xpuntil%-%atk2xp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npctype%^^!
echo.
echo It now has %health% health left.
echo.
echo You gain %playerxp% EXP.
pause>nul
if %levell% GEQ 37 set /a xpuntil=1
if %playerxp% GEQ 1000000 set /a playerxp=1000000
if %health% LEQ 0 goto checkiflvlup2
if %xpuntil% LEQ 0 goto levelup2
goto fs3-2


:fs3-2
set destination=fs3-2
if %npctype% EQU Rat set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Giant-Spider set /a dmgnpc=%random%*68/32767+1
if %npctype% EQU Mutant-Wolf set /a dmgnpc=%random%*65/32767+1
if %npctype% EQU Wolf set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU John set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Bear set /a dmgnpc=%random%*110/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Mites set /a dmgnpc=%random%*105/32767+1
if %npctype% EQU Zombie-Chiken set /a dmgnpc=%random%*98/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*155/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*380/32767+1
if %npctype% EQU Theif set /a dmgnpc=%random%*325/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*415/32767+1
if %armtype% EQU Cloth set /a dr=%random%*10/32767+1
if %armtype% EQU Chain set /a dr=%random%*20/32767+1
if %armtype% EQU Bronze set /a dr=%random%*40/32767+1
if %armtype% EQU Iron set /a dr=%random%*65/32767+1
if %armtype% EQU Steel set /a dr=%random%*100/32767+1
if %armtype% EQU Gold set /a dr=%random%*120/32767+1
if %armtype% EQU Crystal set /a dr=%random%*145/32767+1
if %armtype% EQU Sacred set /a dr=%random%*175/32767+1
if %armtype% EQU Runic set /a dr=%random%*200/32767+1
if %armtype% EQU Infernal set /a dr=%random%*215/32767+1
if %armtype% EQU Omega set /a dr=%random%*230/32767+1
if %armtype% EQU Chaotic set /a dr=%random%*250/32767+1
if %armtype% EQU Mythical set /a dr=%random%*275/32767+1
if %armtype% EQU Alydril set /a dr=%random%*300/32767+1
if %armtype% EQU Cloth set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chain set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Bronze set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Iron set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Steel set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Gold set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Crystal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Sacred set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Runic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Infernal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Omega set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chaotic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Mythical set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Alydril set /a dmgnpc=%dmgnpc%-%dr%
if %dmgnpc% LEQ 0 set /a dmgnpc=0

cls
echo --------------------------------------
echo - Your Health: %hp%
echo - %npctype%'s Health: %health%
echo --------------------------------------
echo.
echo The %npctype% attacks.
echo.
ping localhost -n 2 >nul
echo The %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die2
echo.
echo You now have %hp% health left.
pause>nul
if %xpuntil% LEQ 0 goto levelup2
goto fs1-2


:checkiflvlup2
set destination=checkiflvlup2
if %xpuntil% LEQ 0 goto levelup2



:dropitem2
set destination=dropitem2
if %npctype% EQU Giant-Spider goto Giant-Spiderdrop2
if %npctype% EQU Mutant-Wolf goto Mutant-Wolfdrop2
if %npctype% EQU Wolf goto Wolfdrop2
if %npctype% EQU John goto Johndrop2
if %npctype% EQU Bear goto Beardrop2
if %npctype% EQU Human goto humandrop2
if %npctype% EQU Mites goto Mitesdrop2
if %npctype% EQU Zombie-Chiken goto Zombie-Chikendrop2
if %npctype% EQU Boulder goto Boulderdrop2
if %npctype% EQU Corrupted goto Corrupteddrop2
if %npctype% EQU Theif goto theifdrop2
if %npctype% EQU Bob goto Bobdrop2
if %npctype% EQU Rat goto Zombie-Chikendrop2

::set /a gmail=%gmail%+1
:Giant-Spiderdrop2
set destination=Giant-Spiderdrop2
set word=1
set drop=Spider Fang
set /a fangs=%fangs%+1
goto win2

:Mutant-Wolfdrop2
set destination=Mutant-Wolfdrop2
set word=1
set drop=Mutant Pelt
set /a pelt=%pelt%+1
goto win2

:Wolfdrop2
set destination=Wolfdrop2
set word=2
set drop=Pelts
set /a pelt2=%pelt2%+2
goto win2

:Johndrop2
set destination=Johndrop2
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
goto win2

:Beardrop2
set destination=Beardrop2
set word=3
set drop=pelt
set /a pelt2=%pelt2%+3
goto win2

:humandrop2
set destination=humandrop2
set word=1
set drop=Human Skin
set /a skin=%skin%+1
goto win2

:Mitesdrop2
set destination=Mitesdrop2
set word=1
set drop= Seed
set /a seeds=%seeds%+1
goto win2

:Zombie-Chikendrop2
set destination=Zombie-Chikendrop2
set word=1
set drop=Zombie Feather
set /a zombief=%zombief%+1
goto win2

:Boulderdrop2
set destination=Boulderdrop2
set word=4
set drop=Rocks
set /a rocks=%rocks%+4
goto win2

:Corrupteddrop2
set destination=Corrupteddrop2
set word=2
set drop=Corrupted Shard
set /a cshard=%cshard%+2
goto win2

:theifdrop2
set destination=theifdrop2
set word=3
set drop=Old Coins
set /a ocoins=%ocoins%+3
goto win2

:Bobdrop2
set destination=Bobdrop2
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
goto win2


:levelup2
set destination=levelup2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a xpuntil=%xpuntil%+%origxp%
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a runes=%runes%+85
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have leveled up! You are now level %levell%.
echo ---------------------------------------
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto town1
)
goto levelup2



:win2
set destination=win2
set /a hp=%orighp%
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo Congrats Adventurer!
echo ---------------------------------------
echo.
echo You won the battle against the %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto town1
)
goto win2

:die2
set destination=die2
set /a killcount=0
set /a hp=%orighp%
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You died... Another one bites the dust...
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto town1
)
goto die2







// MARK: Solev
:town1
set destination=town1
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo The Town Know As Salv
echo ---------------------------------------
echo.
echo [%s1%] Trade Market
echo [%s2%] Quest Board
echo.
echo ---------------------------------------
echo [%s3%] leave
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto tm
if "%select%"=="2" set select=1&goto town1
if "%select%"=="3" set select=1&goto MENU
)
goto town1
// MARK: Trade Market
:tm
set destination=tm
cls
if %select% gtr 10 set select=1
if %select% lss 1 set select=10
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s%select%=@
echo ---------------------------------------
echo Welcome To The Salv Trade Market!
echo ---------------------------------------
echo Pg.1
echo You have %runes% Runes.
echo.
echo [%s1%] Goblin Mail: %gmail%
echo 5 Runes Each
echo.
echo [%s2%] Crab Legs: %clegs%
echo 3 Runes Each
echo.
echo [%s3%] Buff-Lobster Legs: %bufflegs%
echo 8 Runes Each
echo.
echo [%s4%] Broken Fishing Rod: %bfp%
echo 6 Runes Each
echo.
echo [%s5%] Dave Brain Fragment: %dbrain%
echo 10 Runes Each
echo.
echo [%s6%] Human Skin: %skin%
echo 8 Runes Each
echo.
echo [%s7%] Seeds: %seeds%
echo 1 Runes Each
echo.
echo [%s8%] Fish Fins: %fins%
echo 7 Runes Each
echo.
echo ---------------------------------------
echo [%s9%] Next Page
echo [%s10%] Back
echo.
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&set gcho=gmail
if "%select%"=="1" set select=1&set spl=5
if "%select%"=="1" set select=1&goto buysell
if "%select%"=="2" set select=1&set gcho=clegs
if "%select%"=="2" set select=1&set spl=3
if "%select%"=="2" set select=1&goto buysell
if "%select%"=="3" set select=1&set gcho=bufflegs
if "%select%"=="3" set select=1&set spl=8
if "%select%"=="3" set select=1&goto buysell
if "%select%"=="4" set select=1&set gcho=bfp
if "%select%"=="4" set select=1&set spl=6
if "%select%"=="4" set select=1&goto buysell
if "%select%"=="5" set select=1&set gcho=dbrain
if "%select%"=="5" set select=1&set spl=10
if "%select%"=="5" set select=1&goto buysell
if "%select%"=="6" set select=1&set gcho=skin
if "%select%"=="6" set select=1&set spl=8
if "%select%"=="6" set select=1&goto buysell
if "%select%"=="7" set select=1&set gcho=seeds
if "%select%"=="7" set select=1&set spl=1
if "%select%"=="7" set select=1&goto buysell
if "%select%"=="8" set select=1&set gcho=fins
if "%select%"=="8" set select=1&set spl=7
if "%select%"=="8" set select=1&goto buysell
if "%select%"=="9" set select=1&goto tm2
if "%select%"=="10" set select=1&goto town1
)
goto tm
:buysell
set destination=buysell
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo Would you like to buy or sell that item. 
echo ---------------------------------------
echo.
echo [%s1%] Buy
echo [%s2%] Sell
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto buyitem
if "%select%"=="2" set select=1&goto sellitem
if "%select%"=="3" set select=1&goto tm
)
goto buysell

:buyitem
set destination=buyitem
echo.
set /p g3=Enter the amount you would like to purchase: 
if %g3% LSS 0 goto tm
set /a cost=%spl%*%g3%
if %cost% GTR %runes% goto notenoughrunes2
set /a runes=%runes%-%cost%
set /a %gcho%=%gcho%+%g3%
echo.
echo Bought %g3% of that item for %cost%.
echo.
pause>nul
goto tm

:sellitem
set destination=sellitem
echo.
set /p g4=Enter the amount of that item you would like to sell: 
if %gcho% LSS %g4% goto tm
set /a price=%spl%*%g4%
set /a runes=%runes%+%price%
set /a %gcho%=%gcho%-%g4%
echo.
echo Sold %g4% of that item for %price%.
echo.
pause>nul
goto tm

:tm2
set destination=tm2
cls
if %select% gtr 10 set select=1
if %select% lss 1 set select=10
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s%select%=@
echo ---------------------------------------
echo Welcome To The Salv Trade Market!
echo ---------------------------------------
echo Pg.2
echo You have %runes% Runes.
echo.
echo [%s1%] Rocks: %rocks%
echo 2 Runes Each
echo.
echo [%s2%] Rocks: %rocks%
echo 2 Runes Each
echo.
echo [%s3%] Bobs Tear: %bobst%
echo 80 Runes Each
echo.
echo [%s4%] Spider Fangs: %fangs%
echo 5 Runes Each
echo.
echo [%s5%] Mutant Pelt: %pelt%
echo 20 Runes Each
echo.
echo [%s6%] Pelt: %pelt2%
echo 5 Runes Each
echo.
echo [%s7%] Corrupted Shards: %cshard%
echo 12 Runes Each
echo.
echo [%s8%] Zombie Feather: %zombief%
echo 20 Runes Each
echo.
echo ---------------------------------------
echo [%s9%] Last Page
echo [%s10%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&set gcho=rocks
if "%select%"=="1" set select=1&set spl=2
if "%select%"=="1" set select=1&goto buysell
if "%select%"=="2" set select=1&set gcho=ocoins
if "%select%"=="2" set select=1&set spl=2
if "%select%"=="2" set select=1&goto buysell
if "%select%"=="3" set select=1&set gcho=bobst
if "%select%"=="3" set select=1&set spl=80
if "%select%"=="3" set select=1&goto buysell
if "%select%"=="4" set select=1&set gcho=fangs
if "%select%"=="4" set select=1&set spl=5
if "%select%"=="4" set select=1&goto buysell
if "%select%"=="5" set select=1&set gcho=pelt
if "%select%"=="5" set select=1&set spl=20
if "%select%"=="5" set select=1&goto buysell
if "%select%"=="6" set select=1&set gcho=pelt2
if "%select%"=="6" set select=1&set spl=5
if "%select%"=="6" set select=1&goto buysell
if "%select%"=="7" set select=1&set gcho=cshard
if "%select%"=="7" set select=1&set spl=12
if "%select%"=="7" set select=1&goto buysell
if "%select%"=="8" set select=1&set gcho=zombief
if "%select%"=="8" set select=1&set spl=20
if "%select%"=="8" set select=1&goto buysell
if "%select%"=="9" set select=1&goto tm
if "%select%"=="10" set select=1&goto town1
)
goto tm2


// MARK: Quest Board
:questb
if %qc1% GTR 99 goto qf1
set destination=questb
cls
if %select% gtr 8 set select=1
if %select% lss 1 set select=8
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s%select%=@
echo --------------------------------
echo Solev Quest Board
echo --------------------------------
echo.
echo [%s1%] Welcome to hell [%s5%] (Coming Soon)
echo [%s2%] (Coming Soon)   [%s6%] (Coming Soon)
echo [%s3%] (Coming Soon)   [%s7%] (Coming Soon)
echo [%s4%] (Coming Soon)   [%s8%] (Coming Soon)
echo.
echo --------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto quest1
if "%select%"=="2" set select=1&goto quest2
if "%select%"=="3" set select=1&goto quest3
if "%select%"=="4" set select=1&goto quest4
if "%select%"=="5" set select=1&goto quest5
if "%select%"=="6" set select=1&goto quest6
if "%select%"=="7" set select=1&goto quest7
if "%select%"=="8" set select=1&goto quest8
)
goto questb

:quest1



:qf1
set /a runes=%runes%+10000
set /a qc1=0
set destination=MENU
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo --------------------------------
echo %campname%
echo --------------------------------
echo.
echo The quest Welcome To Hell is now complete
echo +10,000 Runes
echo.
echo --------------------------------
echo Curently On Save: %username1%
echo --------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto questb
)
goto qf1








:workshop
set destination=workshop
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo The Workshop
echo ---------------------------------------
echo What do you wan't to do here?
echo.
echo [%s1%] Woodcutting
echo [%s2%] Mining
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto forest
if "%select%"=="2" set select=1&goto cave
if "%select%"=="3" set select=1&goto MENU
)
goto workshop

:forest
set destination=forest
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto cut
if "%select%"=="2" set select=1&goto workshop
)
goto forest

:cut
set destination=cut
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Cuting [/    ]
timeout /t 1 /nobreak >nul
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Cuting [//   ]
timeout /t 1 /nobreak >nul
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Cuting [///  ]
timeout /t 1 /nobreak >nul
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Cuting [//// ]
timeout /t 1 /nobreak >nul
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Cuting [/////]
timeout /t 1 /nobreak >nul
cls
echo ---------------------------------------
echo The Forest
echo ---------------------------------------
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%\%Woodcuttingmaxxp%
echo.
echo [%s1%] Cut Down A tree
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
if %Woodcuttingxpleft% LEQ 1 goto Woodcuttinglevelup
set /a Woodcuttingcurxp=%Woodcuttingcurxp%+100
set /a Woodcuttingxpleft=%Woodcuttingxpleft%-100
echo Finnished! +100 xp
goto forest

:Woodcuttinglevelup
set destination=Woodcuttinglevelup
set /a Woodcuttinglvl=%Woodcuttinglvl%+1
set /a Woodcuttingmaxxp=%Woodcuttingmaxxp%+100
set /a Woodcuttingxpleft=%Woodcuttingxpleft%+%Woodcuttingmaxxp%
set /a Woodcuttingcurxp=0
set /a ttlvl=%ttlvl%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have leveled up! You are now level %Woodcuttinglvl%
echo ---------------------------------------
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto forest
)
goto Woodcuttinglevelup



:cave
set destination=cave
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=@
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto mine
if "%select%"=="2" set select=1&goto workshop
)
goto cave
:mine
set destination=mine
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Mining [/    ]
timeout /t 1 /nobreak >nul
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Mining [//   ]
timeout /t 1 /nobreak >nul
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Mining [///  ]
timeout /t 1 /nobreak >nul
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Mining [//// ]
timeout /t 1 /nobreak >nul
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo Mining [/////]
timeout /t 1 /nobreak >nul
cls
echo mining level: %mininglvl%
echo Current EXP: %miningcurxp%\%miningmaxxp%
echo ---------------------------------------
echo The cave
echo ---------------------------------------
echo.
echo [%s1%] Mine A Rock
echo.
echo ---------------------------------------
echo [%s2%] Leave
echo.
echo [%s1%] Mine A Rock
echo [%s2%] Leave
echo.
if %miningxpleft% LEQ 1 goto mininglevelup
set /a miningcurxp=%miningcurxp%+100
set /a miningxpleft=%miningxpleft%-100
echo Finnished! +100 xp
goto cave

:mininglevelup
set destination=mininglevelup 
set /a mininglvl=%mininglvl%+1
set /a miningmaxxp=%miningmaxxp%+100
set /a miningxpleft=%miningxpleft%+%miningmaxxp%
set /a miningcurxp=0
set /a ttlvl=%ttlvl%+1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have leveled up! You are now level %mininglvl%
echo ---------------------------------------
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto cave
)
goto mininglevelup


// MARK: mainmenu
:mainmenu
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo BeyondMMO Menu
echo ----------------------------
echo What Would You Like To Do?
echo .
echo [%s1%] Settings
echo [%s2%] Save
echo [%s3%] Quit
echo [%s4%] Back
echo.
echo ----------------------------
echo Curently On Save: %username1%
echo ----------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto settings
if "%select%"=="2" set select=1&goto SAVE_GAME_FILES
if "%select%"=="3" set select=1&goto startgame
if "%select%"=="4" set select=1&goto %destination%
)
goto mainmenu










:checkitemsINV
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=@
echo ---------------------------------------
echo %username1%'s Stats
echo ---------------------------------------
echo Health: %hp%\%orginhp%
echo Level: %levell%
echo Total Level: %ttlvl%
echo Runes: %runes%
echo EXP: %playerxp%
echo EXP Until Level: %xpuntil%
echo Weapon: %swordtype% %skind%
echo Armor: %armortype% %skindA%
echo ---------------------------------------
echo Select Bag.
echo ---------------------------------------
echo.
echo [%s1%] Backpack
echo [%s2%] Material Pouch
echo.
echo ---------------------------------------
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
if "%select%"=="2" set select=1&goto checkitemsP2IN
if "%select%"=="3" set select=1&goto %destination%
)
goto checkitemsINV



:checkitemsIN
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
echo %username1%'s Backpack.
echo ---------------------------------------
echo.
if %potiont1% GTR 0 echo Health Potion T1 - 25: %potiont1%
if %potiont2% GTR 0 echo Health Potion T2 - 50: %potiont2%
if %potiont3% GTR 0 echo Health Potion T3 - 100: %potiont3%
if %dchest% GTR 0 echo Dungeon Chest T1: %dchest%
echo.
if %sword1% GTR 0 echo Plastic Sword: %sword1%
if %sword2% GTR 0 echo Old Dagger: %sword2%
if %sword3% GTR 0 echo Refurbished Glave: %sword3%
if %sword4% GTR 0 echo Strong Staff: %sword4%
if %sword5% GTR 0 echo Gold Shank: %sword5%
if %sword6% GTR 0 echo Masters Katana: %sword6%
if %sword7% GTR 0 echo Flying Dagger: %sword7%
if %sword8% GTR 0 echo Masters Staff: %sword8%
echo.
if %armor1% GTR 0 echo Cardbord Plate: %armor1%
if %armor2% GTR 0 echo ^*Creative Amror Name^*: %armor2%
if %armor3% GTR 0 echo Steel Boots: %armor3%
if %armor4% GTR 0 echo Cosmic Helmet: %armor4%
if %armor5% GTR 0 echo Furr Suit: %armor5%
if %armor6% GTR 0 echo Titanium Armor: %armor6%
if %armor7% GTR 0 echo Cosmic ^Set: %armor7%
if %armor8% GTR 0 echo Armor #168-2: %armor8%
echo.
echo ---------------------------------------
echo.
echo [%s1%] Heal
echo [%s2%] Change Weapon
echo [%s3%] Change Armor
echo.
echo Page: ^1
echo ---------------------------------------
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto healmenuINV
if "%select%"=="2" set select=1&goto weaponselectINV
if "%select%"=="3" set select=1&goto armorselectINV
if "%select%"=="4" set select=1&goto checkitemsINV
)
goto checkitemsIN

:checkitemsP2IN
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo %username1%'s Material Pouch.
echo ---------------------------------------
echo.
if %gmail% GTR 0 echo Goblin Mail: %gmail%
if %clegs% GTR 0 echo Crab Legs: %clegs%
if %bufflegs% GTR 0 echo Buff-Lobster Legs: %bufflegs%
if %bfp% GTR 0 echo Broken Fishing Pole: %bfp%
if %dbrain% GTR 0 echo Dave Brain Fragment: %dbrain%
if %skin% GTR 0 echo Human Skin: %skin%
if %seeds% GTR 0 echo Seeds: %seeds%
if %fins% GTR 0 echo Fish Fins: %fins%
if %rocks% GTR 0 echo Rocks: %rocks%
if %cshard% GTR 0 echo Corrupted Shards: %cshard%
if %ocoins% GTR 0 echo Old Coins: %ocoins%
if %bobst% GTR 0 echo Bobs Tear: %bobst%
if %fangs% GTR 0 echo Spider Fnags: %fangs%
if %pelt2% GTR 0 echo Pelt: %pelt2%
if %pelt% GTR 0 echo Mutant Pelt: %pelt%
if %zombief% GTR 0 echo Mutant Pelt: %zombief%
echo.
echo ---------------------------------------
echo Page: ^2
echo ---------------------------------------
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsINV
)
goto checkitemsP2IN

:weaponselectINV
set /a numswords=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo ---------------------------------------
echo You currentlyly have a %swordtype% %skind% equipped.
echo ---------------------------------------
echo Select a sword to equip.
echo.
echo [%s1%] Plastic Sword: %sword1%
echo [%s2%] Old Dagger: %sword2%
echo [%s3%] Refurbished Glave: %sword3%
echo [%s4%] Strong Staff: %sword4%
echo [%s5%] Gold Shank: %sword5%
echo [%s6%] Masters Katana: %sword6%
echo [%s7%] Flying Dagger: %sword7%
echo [%s8%] Masters Staff: %sword8%
echo.
echo ---------------------------------------
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1INV
if "%select%"=="2" set select=1&goto equips2INV
if "%select%"=="3" set select=1&goto equips3INV
if "%select%"=="4" set select=1&goto equips4INV
if "%select%"=="5" set select=1&goto equips5INV
if "%select%"=="6" set select=1&goto equips6INV
if "%select%"=="7" set select=1&goto equips7INV
if "%select%"=="8" set select=1&goto equips8INV
if "%select%"=="9" set select=1&goto checkitemsIN
)
goto weaponselectINV

:equips1INV
if %sword1% EQU 0 goto noswordINV
if %swordtype% EQU Plastic goto alreadyequipINV
set swordtype=Plastic
set skind=Sword
set aan=a
goto confirmequipINV

:equips2INV
if %sword2% EQU 0 goto noswordINV
if %swordtype% EQU Old goto alreadyequipINV
set swordtype=Old
set skind=Dagger
set aan=a
goto confirmequipINV

:equips3INV
if %sword3% EQU 0 goto noswordINV
if %swordtype% EQU Refurbished goto alreadyequipINV
set swordtype=Refurbished
set skind=Glave
set aan=a
goto confirmequipINV

:equips4INV
if %sword4% EQU 0 goto noswordINV
if %swordtype% EQU Strong goto alreadyequipINV
set swordtype=Strong
set skind=Staff
set aan=a
goto confirmequipINV

:equips5INV
if %sword5% EQU 0 goto noswordINV
if %swordtype% EQU Gold goto alreadyequipINV
set swordtype=Gold
set skind=Shank
set aan=a
goto confirmequipINV

:equips6INV
if %sword6% EQU 0 goto noswordINV
if %swordtype% EQU Masters goto alreadyequipINV
set swordtype=Masters
set skind=Katana
set aan=a
goto confirmequipINV

:equips7INV
if %sword7% EQU 0 goto noswordINV
if %swordtype% EQU Flying goto alreadyequipINV
set swordtype=Flying
set skind=Dagger
set aan=a
goto confirmequipINV

:equips8INV
if %sword8% EQU 0 goto noswordINV
if %swordtype% EQU Masters goto alreadyequipINV
set swordtype=Masters
set skind=Staff
set aan=a
goto confirmequipINV

:confirmequipINV
set destination=confirmequipINV
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have equipped %aan% %swordtype% %skind%.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto confirmequipINV

:noswordINV
set destination=noswordINV
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have that weapon.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto noswordINV


:alreadyequipINV
set destination=alreadyequipINV
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You already have that weapon equipped.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto alreadyequipINV

:armorselectINV
cls
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=@
echo.
echo You currently have a %armortype% %skindA% equipped.
echo.
echo Select a sword to equip, or return to battle.
echo [%s1%] Cardbord Plate: %armor1%
echo [%s2%] ^*Creative Armor Name*^: %armor2%
echo [%s3%] Steel Boots: %armor3%
echo [%s4%] Cosmic Helmet: %armor4%
echo [%s5%] Furr Suit: %armor5%
echo [%s6%] Titanium Armor: %armor6%
echo [%s7%] Cosmic ^Set: %armor7%
echo [%s8%] Armor #168-2 %armor8%
echo [%s9%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1INVA
if "%select%"=="2" set select=1&goto equips2INVA
if "%select%"=="3" set select=1&goto equips3INVA
if "%select%"=="4" set select=1&goto equips4INVA
if "%select%"=="5" set select=1&goto equips5INVA
if "%select%"=="6" set select=1&goto equips6INVA
if "%select%"=="7" set select=1&goto equips7INVA
if "%select%"=="8" set select=1&goto equips8INVA
if "%select%"=="9" set select=1&goto checkitemsIN
)
goto armorselectINV

:equips1INVA
if %armor1% EQU 0 goto noarmorA
if %armortype% EQU Cardbord goto alreadyequipINVA
set armortype=Cardbord
set skindA=Plate
set aan=a
goto confirmequipINVA

:equips2INVA
if %armor2% EQU 0 goto noarmorA
if %armortype% EQU Creative goto alreadyequipINVA
set armortype=Creative
set skindA=Name
set aan=a
goto confirmequipINVA

:equips3INVA
if %armor3% EQU 0 goto noarmorA
if %armortype% EQU Steel goto alreadyequipINVA
set armortype=Steel
set skindA=Boots
set aan=a
goto confirmequipINVA

:equips4INVA
if %armor4% EQU 0 goto noarmorA
if %armortype% EQU Cosmic goto alreadyequipINVA
set armortype=Cosmic
set skindA=Helmet
set aan=a
goto confirmequipINVA

:equips5INVA
if %armor5% EQU 0 goto noarmorA
if %armortype% EQU Furr goto alreadyequipINVA
set armortype=Furr
set skindA=Suit
set aan=a
goto confirmequipINVA

:equips6INVA
if %armor6% EQU 0 goto noarmorA
if %armortype% EQU Titanium goto alreadyequipINVA
set armortype=Titanium
set skindA=Armor
set aan=a
goto confirmequipINVA

:equips7INVA
if %armor7% EQU 0 goto noarmorA
if %armortype% EQU Set goto alreadyequipINVA
set armortype=Cosmic
set skindA=Set
set aan=a
goto confirmequipINVA

:equips8INVA
if %armor8% EQU 0 goto noarmorA
if %armortype% EQU Armor goto alreadyequipINVA
set armortype=Armor
set skindA=#168-2
set aan=a
goto confirmequipINVA

:confirmequipINVA
set destination=confirmequipINVA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You have equipped %armortype% %skindA%.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto confirmequipINVA

:noarmorA
set destination=noarmorA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You don't have that Armor.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto noarmorA


:alreadyequipINVA
set destination=alreadyequipINVA
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=@
echo ---------------------------------------
echo You already have that armor equipped.
echo ---------------------------------------
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto alreadyequipINVA

:healmenuINV
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=@
echo ---------------------------------------
echo Health Potion Selection.
echo ---------------------------------------
echo.
echo [%s1%] Health Potion T1 - 25: %potiont1%
echo [%s2%] Health Potion T2 - 50: %potiont2%
echo [%s3%] Health Potion T3 - 100: %potiont3%
echo.
echo ---------------------------------------
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto heal1IVN
if "%select%"=="2" set select=1&goto heal2IVN
if "%select%"=="3" set select=1&goto heal3IVN
if "%select%"=="4" set select=1&goto checkitemsIN
)
goto healmenuINV

:heal1IVN
if %hp% EQU %orginhp% Goto healmenuINV
cls
echo.
if %potiont1% LSS 1 goto howughINV?
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
echo ---------------------------------------
echo You have been healed by 25 Hp.
echo ---------------------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto heal1IVN

:heal2IVN
if %hp% EQU %orginhp% Goto healmenuINV
cls
echo.
if %potiont2% LSS 1 goto howughINV?
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
echo ---------------------------------------
echo You have been healed by 50 Hp.
echo ---------------------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto heal2IVN

:heal3IVN
if %hp% EQU %orginhp% Goto healmenuINV
cls
echo.
if %potiont3% LSS 1 goto howughINV?
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
echo ---------------------------------------
echo You have been healed by 100 Hp.
echo ---------------------------------------
echo Your Health is now %hp%
echo.
echo [%s1%] Okay
echo.
echo ---------------------------------------
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto heal3IVN

:howughINV
echo ???
echo ------------
echo How did you get here?
echo O-O?
pause>nul
goto healmenuINV
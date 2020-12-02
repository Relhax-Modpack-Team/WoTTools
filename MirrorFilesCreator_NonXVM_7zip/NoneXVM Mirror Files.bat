@echo off
title "Non XVM Automation Batch script. Version 1.1. Created by The Illusion."

rem These are the variables you need to alter every time you want to update
rem Make sure to delete the old files before running this bat. I will not be adding that for now.
rem This is only for none XVM

set "gameVersion=1.10.1.4"
set "date=2020-11-25"

rem All variables that are required to make this work.
set "modsDIR=mods\%gameVersion%\"

set "mvi_battle=LogicalDependency_MVI_BATTLE_noXVM"
set "mvi_battle_files=mvi_battle\mods\%gameVersion%\mvi_battle.wotmod"

set "mvi_battle_clear=LogicalDependency_MVI_BATTLE_CLEAR_noXVM"
set "mvi_battle_clear_files=mvi_battle_clear\mods\%gameVersion%\mvi_battle.wotmod"

set "mvi_hangar=LogicalDependency_MVI_HANGAR_showAll_noXVM"
set "mvi_hangar_files=mvi_hangar\mods\%gameVersion%\mvi_hangar.wotmod"

set "mvi_hangar_clear=LogicalDependency_MVI_HANGAR_CLEAR_tier_noXVM"
set "mvi_hangar_clear_files=mvi_hangar_clear\mods\%gameVersion%\mvi_hangar.wotmod"

set "mvi_hangar_clear-all=LogicalDependency_MVI_HANGAR_CLEAR_ALL_noXVM"
set "mvi_hangar_clear-all_files=mvi_hangar_clear-all\mods\%gameVersion%\mvi_hangar.wotmod"

@echo off
cls

rem Clearing all old files before procceding
rd /q /s %modsDIR%
rd /q /s mvi_battle
rd /q /s mvi_battle_clear
rd /q /s mvi_hangar
rd /q /s mvi_hangar_files
rd /q /s mvi_hangar_clear
rd /q /s mvi_hangar_clear-all
DEL /q mvi_battle.zip
DEL /q mvi_battle_clear.zip
DEL /q mvi_hangar.zip
DEL /q mvi_hangar_clear.zip
DEL /q mvi_hangar_clear-all.zip
DEL /q %mvi_battle%_%gameVersion%_%date%.zip
DEL /q %mvi_battle_clear%_%gameVersion%_%date%.zip
del /q %mvi_hangar%_%gameVersion%_%date%.zip
DEL /q %mvi_hangar_clear%_%gameVersion%_%date%.zip
DEL /q %mvi_hangar_clear-all%_%gameVersion%_%date%.zip

rem This will download the files. Yay! More automation!

@echo off
cls

set "download=certutil.exe -urlcache -split -f"

%download% "https://github.com/AstaRom/wot_mods/raw/master/mvi/mvi_battle.zip" mvi_battle.zip
%download% "https://github.com/AstaRom/wot_mods/raw/master/mvi/mvi_battle_clear.zip" mvi_battle_clear.zip
%download% "https://github.com/AstaRom/wot_mods/raw/master/mvi/mvi_hangar.zip" mvi_hangar.zip
%download% "https://github.com/AstaRom/wot_mods/raw/master/mvi/mvi_hangar_clear.zip" mvi_hangar_clear.zip
%download% "https://github.com/AstaRom/wot_mods/raw/master/mvi/mvi_hangar_clear-all.zip" mvi_hangar_clear-all.zip

@echo off
cls

rem extracting the downloaded zips

if exist temp ^
RD /S /Q temp

7z x mvi_battle.zip -omvi_battle
7z x mvi_battle_clear.zip -omvi_battle_clear
7z x mvi_hangar.zip -omvi_hangar
7z x mvi_hangar_clear.zip -omvi_hangar_clear
7z x mvi_hangar_clear-all.zip -omvi_hangar_clear-all

rem Making the actual DB files
md %modsDIR%
xcopy /v /y "%mvi_battle_files%" "%modsDIR%"
7z a -tzip -mx0 %mvi_battle%_%gameVersion%_%date%.zip "mods"
rd /q /s "mods"

md %modsDIR%
xcopy /v /y "%mvi_battle_clear_files%" "%modsDIR%"
7z a -tzip -mx0 %mvi_battle_clear%_%gameVersion%_%date%.zip "mods"
rd /q /s "mods"

md %modsDIR%
xcopy /v /y "%mvi_hangar_files%" "%modsDIR%"
7z a -tzip -mx0 %mvi_hangar%_%gameVersion%_%date%.zip "mods"
rd /q /s "mods"

md %modsDIR%
xcopy /v /y "%mvi_hangar_clear_files%" "%modsDIR%"
7z a -tzip -mx0 %mvi_hangar_clear%_%gameVersion%_%date%.zip "mods"
rd /q /s "mods"

md %modsDIR%
xcopy /v /y "%mvi_hangar_clear-all_files%" "%modsDIR%"
7z a -tzip -mx0 %mvi_hangar_clear-all%_%gameVersion%_%date%.zip "mods"
rd /q /s "mods"

@echo off
cls

rem remove old files again. First set is if using old version
rd /q /s %modsDIR%
rd /q /s mvi_battle
rd /q /s mvi_battle_clear
rd /q /s mvi_hangar
rd /q /s mvi_hangar_files
rd /q /s mvi_hangar_clear
rd /q /s mvi_hangar_clear-all
DEL /q mvi_battle.zip
DEL /q mvi_battle_clear.zip
DEL /q mvi_hangar.zip
DEL /q mvi_hangar_clear.zip
DEL /q mvi_hangar_clear-all.zip

@echo off
cls

echo "Process Complete!"

pause

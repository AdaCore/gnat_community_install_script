@echo off
setlocal

set len=0
for %%x in (%*) do set /A len+=1

if %len% NEQ 2 if %len% NEQ 3 (
   echo Usage: install_package.bat  package  install_dir [components]
   exit /B 1
)

set package=%1
set target=%2
set components=%3

if exist %target% (
   echo Target directory already exists
   exit /B 1
)

%package% --script install_script.qs InstallPrefix="%target% Components="%components%"

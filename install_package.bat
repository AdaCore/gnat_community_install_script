@echo off
setlocal

set len=0
for %%x in (%*) do set /A len+=1

if not %len% == 2 (
   echo Usage: install_package.bat  package  install_dir
   exit /B 1
)

set package=%1
set target=%2

if exist %target% (
   echo Target directory already exists
   exit /B 1
)

%package% --script install_script.qs InstallPrefix="%target%

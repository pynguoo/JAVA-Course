@echo off&setlocal enabledelayedexpansion

for /f "delims=" %%a in (%1) do (
   set tmp=%%aargs[
   set tmp=!tmp:"=!
   set tmp=!tmp:args[=" "args[!
   for %%a in ("!tmp!") do set /a n+=1
   set /a n-=2
)
echo %1 �� !n! �ӰѼƻݭn��J

set ClassName=%1
set ClassName=%ClassName:.java=%
::echo %ClassName%

mkdir %ClassName%
setlocal ENABLEEXTENSIONS 
set "FileFirstLine=" 
for /f "delims=" %%a in ('more ^< %1') do ( 
if not defined FileFirstLine set FileFirstLine=%%a 
) 
set FileFirstLine=%FileFirstLine:;=%
set FileFirstLine=%FileFirstLine:package =%
::echo %FileFirstLine%

set PathName=%FileFirstLine%.%ClassName%
set PathName=%PathName: =%
javac %1 -d .\%ClassName%

set Parameters=0
:loop 
if "%2"=="" goto :done
::echo %2
set Parameters=%Parameters% %2
shift
goto :loop

:done
set Parameters=%Parameters:0 =%
::echo %Parameters%
echo.
echo �H�U���sĶ���G 
echo.
java -cp .\%ClassName% %PathName% %Parameters%
rd /s /q  %ClassName%
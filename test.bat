@echo off&setlocal enabledelayedexpansion
for /f "delims=" %%a in (%1) do (
   set tmp=%%aargs[
   set tmp=!tmp:"=!
   set tmp=!tmp:args[=" "args[!
   for %%a in ("!tmp!") do set /a n+=1
   set /a n-=2
)
echo %1 中有 !n! 個參數需要輸入

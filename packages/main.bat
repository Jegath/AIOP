@echo off 
echo.%PATH%|findstr "%cd%" >nul 2>&1 
if errorlevel 1 ( 
  for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH') do @if [%%b]==[] ( @setx PATH "%%~a;%cd%" ) else ( @setx PATH "%%~a %%~b;%cd%" ) 
) 
echo.%PATH%|findstr "%cd%\Scripts" >nul 2>&1 
if errorlevel 1 ( 
   for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH') do @if [%%b]==[] ( @setx PATH "%%~a;%cd%\Scripts" ) else ( @setx PATH "%%~a %%~b;%cd%\Scripts" ) 
) 
echo.%PATH%|findstr "%cd%\Lib\site-packages" >nul 2>&1 
if errorlevel 1 ( 
   for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH') do @if [%%b]==[] ( @setx PATH "%%~a;%cd%\Lib\site-packages" ) else ( @setx PATH "%%~a %%~b;%cd%\Lib\site-packages" ) 
) 

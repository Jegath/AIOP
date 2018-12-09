@echo off
@echo @echo off > "%cd%\packages\"main.bat
for /F "tokens=*" %%A in (names.txt) do @echo python pip.whl\pip install %%A >> "%cd%\packages\"main.bat
cd packages
@echo echo.%%PATH%%^|findstr "%%cd%%" ^>nul 2^>^&1 >> main.bat
@echo if errorlevel 1 ( >> main.bat
@echo   for /f "skip=2 tokens=3*" %%%%a in ('reg query HKCU\Environment /v PATH') do @if [%%%%b]==[] ( @setx PATH "%%%%~a;%%cd%%" ) else ( @setx PATH "%%%%~a %%%%~b;%%cd%%" ) >> main.bat
@echo ) >> main.bat
@echo echo.%%PATH%%^|findstr "%%cd%%\Scripts" ^>nul 2^>^&1 >> main.bat
@echo if errorlevel 1 ( >> main.bat
@echo    for /f "skip=2 tokens=3*" %%%%a in ('reg query HKCU\Environment /v PATH') do @if [%%%%b]==[] ( @setx PATH "%%%%~a;%%cd%%\Scripts" ) else ( @setx PATH "%%%%~a %%%%~b;%%cd%%\Scripts" ) >> main.bat
@echo ) >> main.bat
@echo echo.%%PATH%%^|findstr "%%cd%%\Lib\site-packages" ^>nul 2^>^&1 >> main.bat
@echo if errorlevel 1 ( >> main.bat
@echo    for /f "skip=2 tokens=3*" %%%%a in ('reg query HKCU\Environment /v PATH') do @if [%%%%b]==[] ( @setx PATH "%%%%~a;%%cd%%\Lib\site-packages" ) else ( @setx PATH "%%%%~a %%%%~b;%%cd%%\Lib\site-packages" ) >> main.bat
@echo ) >> main.bat
call main.bat
echo ---- Installation complete ---- 
echo .... press any key to close the window ....
PAUSE >nul
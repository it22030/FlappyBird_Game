@echo off
setlocal
cd /d "%~dp0"

set "JAVAFX_PATH=D:\openjfx-23.0.2_windows-x64_bin-sdk\javafx-sdk-23.0.2\lib"
set "MYSQL_JAR=lib\mysql-connector-j.jar"

echo [1/3] Compiling Java files...
if not exist "out\production\FLAPPY_GAME" mkdir "out\production\FLAPPY_GAME"

dir /s /b src\*.java > sources.txt
javac --module-path "%JAVAFX_PATH%" --add-modules javafx.controls,javafx.fxml -cp "%MYSQL_JAR%;src" -d "out\production\FLAPPY_GAME" @sources.txt
if %ERRORLEVEL% neq 0 (
    echo Compilation failed!
    del sources.txt 2>nul
    exit /b %ERRORLEVEL%
)
del sources.txt 2>nul

echo [2/3] Syncing assets...
xcopy /E /I /Y "src\Application\Fxmls" "out\production\FLAPPY_GAME\Application\Fxmls" > nul 2>nul
copy /Y "src\Application\styles.css" "out\production\FLAPPY_GAME\Application\styles.css" > nul 2>nul

echo [3/3] Launching Flappy Bird...
java --module-path "%JAVAFX_PATH%" --add-modules javafx.controls,javafx.fxml -cp "out\production\FLAPPY_GAME;%MYSQL_JAR%" Application.Main

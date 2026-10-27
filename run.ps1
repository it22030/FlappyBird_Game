$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$javafxPath = "D:\openjfx-23.0.2_windows-x64_bin-sdk\javafx-sdk-23.0.2\lib"
$mysqlJar = "lib\mysql-connector-j.jar"
$outDir = "out\production\FLAPPY_GAME"

Write-Host "[1/3] Compiling Java files..." -ForegroundColor Cyan
if (!(Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

$javaFiles = Get-ChildItem -Path "src" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName }
& javac --module-path "$javafxPath" --add-modules javafx.controls,javafx.fxml -cp "$mysqlJar;src" -d "$outDir" $javaFiles

Write-Host "[2/3] Syncing assets..." -ForegroundColor Cyan
Copy-Item -Path "src\Application\Fxmls" -Destination "$outDir\Application\" -Recurse -Force
Copy-Item -Path "src\Application\styles.css" -Destination "$outDir\Application\" -Force

Write-Host "[3/3] Launching Flappy Bird..." -ForegroundColor Green
& java --module-path "$javafxPath" --add-modules javafx.controls,javafx.fxml -cp "$outDir;$mysqlJar" Application.Main

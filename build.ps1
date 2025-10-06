# Build and upload script for ESPHome
param(
    [switch]$USB
)

Write-Host "Building and uploading ESPHome firmware..." -ForegroundColor Green

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Run ESPHome with appropriate upload method
if ($USB) {
    Write-Host "Using USB upload method..." -ForegroundColor Yellow
    esphome run e-paper-display.yaml
} else {
    Write-Host "Using OTA upload method..." -ForegroundColor Yellow
    esphome run --device e-paper-display.local e-paper-display.yaml
}

# Copy YAML file to Home Assistant ESPHome folder
$haPath = "H:\esphome\e-paper-display.yaml"
if (Test-Path "H:\") {
    Write-Host "Copying YAML file to Home Assistant..." -ForegroundColor Cyan
    Copy-Item -Path "e-paper-display.yaml" -Destination $haPath -Force
    Write-Host "YAML file synced to $haPath" -ForegroundColor Green
} else {
    Write-Host "Warning: H:\ drive not accessible. Skipping Home Assistant sync." -ForegroundColor Yellow
}

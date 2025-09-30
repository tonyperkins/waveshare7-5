# Setup script for ESPHome project
Write-Host "Setting up ESPHome virtual environment..." -ForegroundColor Green

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Install dependencies
Write-Host "Installing ESPHome..." -ForegroundColor Yellow
pip install -r requirements.txt

Write-Host "`nSetup complete!" -ForegroundColor Green
Write-Host "To activate the virtual environment, run: .\venv\Scripts\Activate.ps1" -ForegroundColor Cyan
Write-Host "To validate config, run: esphome config e-paper-display.yaml" -ForegroundColor Cyan
Write-Host "To compile and upload, run: esphome run e-paper-display.yaml" -ForegroundColor Cyan

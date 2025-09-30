# Upload ESPHome firmware via USB
Write-Host "Uploading ESPHome firmware via USB..." -ForegroundColor Green

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Run ESPHome with USB upload
esphome upload e-paper-display.yaml

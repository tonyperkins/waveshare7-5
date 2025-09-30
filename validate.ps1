# Validate ESPHome configuration
Write-Host "Validating ESPHome configuration..." -ForegroundColor Green

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Validate config
esphome config e-paper-display.yaml

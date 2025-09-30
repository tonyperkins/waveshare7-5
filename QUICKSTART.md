# Quick Start Guide

## Initial Setup (One Time)

1. **Install ESPHome in virtual environment:**
   ```powershell
   .\setup.ps1
   ```

2. **Your secrets are already configured** in `secrets.yaml`

3. **Weather icons font is ready** in the `fonts/` folder

## Build and Upload to Device

### First Time (USB Connection Required)

1. Connect your ESP32 to your computer via USB

2. Run the build script:
   ```powershell
   .\build.ps1
   ```

3. When prompted, select the USB serial port (e.g., COM3, COM4, etc.)

### Subsequent Updates (Over-The-Air)

Once the device is on your network, you can update wirelessly:

```powershell
.\venv\Scripts\Activate.ps1
esphome run e-paper-display.yaml --device e-paper-display.local
```

## Useful Commands

### Validate Configuration
```powershell
.\validate.ps1
```

### View Logs
```powershell
.\venv\Scripts\Activate.ps1
esphome logs e-paper-display.yaml
```

### Clean Build
```powershell
.\venv\Scripts\Activate.ps1
esphome clean e-paper-display.yaml
esphome run e-paper-display.yaml
```

## Troubleshooting

### Can't find USB port
- Make sure ESP32 is connected via USB
- Install CH340/CP2102 drivers if needed
- Check Device Manager for COM port

### Build errors
- Run `.\validate.ps1` to check configuration
- Ensure virtual environment is activated
- Check that all sensors exist in Home Assistant

### Display not updating
- Check wiring connections (see README.md)
- View logs: `esphome logs e-paper-display.yaml`
- Verify Home Assistant sensors are available

## Project Structure

```
waveshare7-5/
├── e-paper-display.yaml # Main ESPHome configuration
├── secrets.yaml         # WiFi and API credentials
├── requirements.txt     # Python dependencies
├── venv/               # Python virtual environment
├── fonts/              # Weather icons font
├── setup.ps1           # Initial setup script
├── build.ps1           # Build and upload script
├── validate.ps1        # Configuration validation script
└── README.md           # Detailed documentation
```

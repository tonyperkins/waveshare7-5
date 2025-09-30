# Waveshare 7.5" E-Paper Display - ESPHome Project

This project configures an ESP32 with a Waveshare 7.5" e-paper display for use with ESPHome and Home Assistant.

## Hardware Requirements

- ESP32 development board
- Waveshare 7.5" e-Paper Display (800x480)
- Connecting wires

## Wiring

Connect the display to the ESP32 as follows:

| Display Pin | ESP32 Pin |
|-------------|-----------|
| VCC         | 3.3V      |
| GND         | GND       |
| DIN (MOSI)  | GPIO23    |
| CLK         | GPIO18    |
| CS          | GPIO5     |
| DC          | GPIO17    |
| RST         | GPIO16    |
| BUSY        | GPIO4     |

## Setup Instructions

### 1. Set Up Python Virtual Environment

The project is configured to use a Python virtual environment. Run the setup script:

```powershell
.\setup.ps1
```

This will:
- Activate the virtual environment
- Install ESPHome and dependencies

**Manual setup (alternative):**
```powershell
# Activate the virtual environment
.\venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt
```

### 2. Configure Secrets

Edit the `secrets.yaml` file and update with your credentials:

- `wifi_ssid`: Your WiFi network name
- `wifi_password`: Your WiFi password
- `fallback_password`: Password for the fallback AP (when WiFi fails)
- `ota_password`: Password for OTA updates
- `api_encryption_key`: Generate this by running the compile command (see below)

### 3. Fonts

The weather icons font has been downloaded to the `fonts/` folder. The configuration uses Google Fonts for text (Roboto, Orbitron) which will be downloaded automatically during compilation.

### 4. Validate Configuration

Before building, validate your configuration:

```powershell
.\validate.ps1
```

Or manually:
```powershell
.\venv\Scripts\Activate.ps1
esphome config e-paper-display.yaml
```

### 5. Compile and Upload

**Using the build script:**
```powershell
.\build.ps1
```

**Or manually:**
```powershell
.\venv\Scripts\Activate.ps1
esphome run e-paper-display.yaml
```

This will:
- Compile the firmware
- Show available upload methods (USB/OTA)
- Upload to the ESP32

### 6. Over-The-Air Updates

After the initial upload, you can update wirelessly:
```powershell
.\venv\Scripts\Activate.ps1
esphome run e-paper-display.yaml --device e-paper-display.local
```

## Features

- **Time Display**: Shows current date and time (synced from Home Assistant)
- **WiFi Status**: Displays WiFi signal strength
- **Web Server**: Access at `http://waveshare-display.local`
- **Manual Refresh**: Button entity to manually refresh the display
- **Auto Update**: Display updates every 5 minutes (configurable)

## Customization

### Change Update Interval

In `e-paper-display.yaml`, modify the `update_interval`:
```yaml
display:
  - platform: waveshare_epaper
    update_interval: 300s  # Change to desired interval
```

### Modify Display Content

Edit the `lambda` section in the display configuration to customize what's shown.

### Change Pin Assignments

If your wiring is different, update the pin assignments in the `spi` and `display` sections.

## Troubleshooting

### Display Not Updating
- Check wiring connections
- Verify the `busy_pin` is correctly connected
- Check ESPHome logs: `esphome logs e-paper-display.yaml`

### WiFi Connection Issues
- Verify credentials in `secrets.yaml`
- Check if the fallback AP appears (SSID: "Waveshare 7.5\" Display Fallback")

### Font Errors
- Ensure font files exist in the `fonts` folder
- Or switch to Google Fonts (gfonts://)

## Home Assistant Integration

Once running, the device will automatically appear in Home Assistant:
- Sensors for WiFi signal and uptime
- Button to manually refresh the display
- Text sensors for IP address and SSID

## Resources

- [ESPHome Documentation](https://esphome.io/)
- [Waveshare Display Component](https://esphome.io/components/display/waveshare_epaper.html)
- [ESP32 Pinout Reference](https://randomnerdtutorials.com/esp32-pinout-reference-gpios/)

## License

This project is open source and available for personal and commercial use.

# 🌤️ Weather App

A simple, clean Flutter weather app that detects your current location and shows live weather conditions — temperature, city name, and a matching background image for the current sky.

## ✨ Features

- 📍 **Auto location detection** — uses the device GPS to find where you are (no manual city search needed)
- 🌡️ **Live weather data** — pulled in real time from the OpenWeatherMap API
- 🖼️ **Dynamic weather visuals** — background image changes based on conditions (sunny, cloudy, rainy, thunderstorm, etc.)
- 📱 **Responsive layout** — adapts cleanly between portrait and landscape orientation
- ⚠️ **Graceful error handling** — clear messages for denied location permissions or failed API calls

## 📦 Download

Grab the latest APK from the [Releases](../../releases) page and install it on your Android device.

> Note: you'll need to enable "install from unknown sources" since this isn't published on the Play Store.

## 🛠️ Tech Stack

| Package | Purpose |
|---|---|
| [`http`](https://pub.dev/packages/http) | Calling the OpenWeatherMap REST API |
| [`geolocator`](https://pub.dev/packages/geolocator) | Getting the device's current GPS coordinates |
| [`geocoding`](https://pub.dev/packages/geocoding) | Reverse geocoding support |
| [`lottie`](https://pub.dev/packages/lottie) | Animations |

## 📁 Project Structure

```
lib/
├── main.dart                  # App entry point
├── Modals/
│   └── WeatherModal.dart      # Weather data model
├── Pages/
│   └── WeatherPage.dart       # Main UI screen
└── Services/
    └── WeatherService.dart    # Location + API logic
```

## 🚀 Getting Started (run from source)

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed
- A free API key from [OpenWeatherMap](https://openweathermap.org/api)

### Setup

1. **Clone the repo**
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   cd <your-repo>
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your API key**

   Open `lib/Pages/WeatherPage.dart` and replace the placeholder:
   ```dart
   final _weatherService = WeatherService('Paste Your API Here');
   ```
   with your actual OpenWeatherMap API key.

4. **Run the app**
   ```bash
   flutter run
   ```

## 🔐 Permissions

This app requires **location permission** to fetch weather for your current position. Make sure location access is enabled on your device/emulator when prompted.

## 🗺️ Roadmap / Ideas

- [ ] Search weather by city name
- [ ] 5-day forecast view
- [ ] Dark mode
- [ ] Lottie weather animations (package already included)

## Git Hub Link

https://github.com/ronitagrawal2007/Weather-App.git

## App Link

https://github.com/ronitagrawal2007/Weather-App/releases/tag/v1.0.0

---

Built with ❤️ using Flutter.

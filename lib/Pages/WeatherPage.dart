import 'package:flutter/material.dart';
import 'package:weather_app/Modals/WeatherModal.dart';
import 'package:weather_app/Services/WeatherService.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('Paste Your API Here');
  Weather? _weather;
  String? _errorMessage;

  Future<void> _feathWeather() async {
    try {
      final weather = await _weatherService.getCurrentWeather();

      if (!mounted) {
        return;
      }

      setState(() {
        _weather = weather;
        _errorMessage = null;
      });
    } on Exception catch (error) {
      if (!mounted) {
        return;
      }

      debugPrint('Failed to load weather: $error');
      setState(() {
        _weather = null;
        _errorMessage = error.toString();
      });
    }
  }

  String getWeatherImage(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/sunny.jpg';
    }

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.jpg';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.jpg';
      case 'thunderstorm':
        return 'assets/thunder.jpg';
      case 'clear':
        return 'assets/sunny.jpg';
      default:
        return 'assets/sunny.jpg';
    }
  }

  @override
  void initState() {
    super.initState();
    _feathWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(_errorMessage!, textAlign: TextAlign.center),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _weather?.cityName ?? 'loading city..',
                        style: TextStyle(fontSize: 40),
                      ),
                      Image.asset(getWeatherImage(_weather?.mainCondition)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_weather?.temperature.round() ?? 0}',
                            style: TextStyle(fontSize: 80),
                          ),
                          Text('°C', style: TextStyle(fontSize: 40)),
                        ],
                      ),
                      Text(
                        _weather?.mainCondition ?? '',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  )
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            getWeatherImage(_weather?.mainCondition),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _weather?.cityName ?? 'loading city..',
                                style: TextStyle(fontSize: 40),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${_weather?.temperature.round() ?? 0}',
                                    style: TextStyle(fontSize: 80),
                                  ),
                                  Text('°C', style: TextStyle(fontSize: 40)),
                                ],
                              ),
                              Text(
                                _weather?.mainCondition ?? '',
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

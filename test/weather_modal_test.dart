import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/Modals/WeatherModal.dart';

void main() {
  test('Weather.fromJson parses current weather data correctly', () {
    final weather = Weather.fromJson({
      'name': 'London',
      'weather': [
        {'main': 'Clouds'},
      ],
      'main': {'temp': 12.5},
    });

    expect(weather.cityName, 'London');
    expect(weather.mainCondition, 'Clouds');
    expect(weather.temperature, 12.5);
  });
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Modals/WeatherModal.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getCurrentWeather() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission denied forever.');
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return getWeatherByCoordinates(position.latitude, position.longitude);
    } on Exception catch (error) {
      debugPrint('Failed to get current weather: $error');
      rethrow;
    }
  }

  Future<Weather> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw Exception(
      'Failed to load weather data (${response.statusCode}): ${response.body}',
    );
  }
}

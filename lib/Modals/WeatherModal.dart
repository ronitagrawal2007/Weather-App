class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] as String,
      mainCondition: json['weather'][0]['main'] as String,
      temperature: (json['main']['temp'] as num).toDouble(),
    );
  }
}

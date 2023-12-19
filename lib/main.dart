import 'package:flutter/material.dart';

void main() {
  final berlinerWeather = WeatherData(
    city: "Berlin",
    temperature: 22.5,
    weatherCondition: WeatherCondition.sunny,
  );
  runApp(MyApp(weatherData: berlinerWeather));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(
        weatherData: weatherData,
      ),
    );
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    final city = weatherData.city;
    final temp = weatherData.temperature;
    final clima = getWeatherName(weatherData.weatherCondition);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Wetter App",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(
              // "Willkommen zur Wetter-App",
              "Aktuelles Wetter in $city",
              style: const TextStyle(color: Colors.blue, fontSize: 32),
            )),
            const SizedBox(
              height: 16,
            ),
            Container(
                child: Text(
              // "Willkommen zur Wetter-App",
              "Temperatur: $temp Grad",
              style: const TextStyle(color: Colors.blue, fontSize: 24),
            )),
            Container(
                child: Text(
              // "Willkommen zur Wetter-App",
              "Wetter: $clima",
              style: const TextStyle(color: Colors.blue, fontSize: 24),
            )),
          ],
        ),
      ),
    );
  }
}

class WeatherData {
  WeatherData({
    required this.city,
    required this.temperature,
    required this.weatherCondition,
  });

  String city;
  double temperature;
  WeatherCondition weatherCondition;
}

enum WeatherCondition { sunny, cloudy, rainy, stormy }

String getWeatherName(WeatherCondition weatherCondiion) {
  switch (weatherCondiion) {
    case WeatherCondition.cloudy:
      return "Bewölkt";
    case WeatherCondition.rainy:
      return "Regnerisch";
    case WeatherCondition.sunny:
      return "Sonnig";
    case WeatherCondition.stormy:
      return "Stürmisch";
  }
}

// enum WeatherCondition {
//   sunny("Sonnig"),
//   cloudy("Bewölkt"),
//   rainy("Regnerisch"),
//   stormy("Stürmisch");

//   const WeatherCondition(this.name);

//   final String name;
// }
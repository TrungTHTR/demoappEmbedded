import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/weather.dart';

class WeatherApiService {
  final _base = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '<YOUR_API_KEY>';

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse('$_base?q=$city&appid=\$apiKey&units=metric');
    final res = await http.get(url);
    final json = jsonDecode(res.body);
    return Weather.fromJson(json);
  }
}
import '../../domain/IRepository/IWeatherRepo.dart';
import '../../domain/entities/weather.dart';
import '../datasources/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService api;
  WeatherRepositoryImpl({required this.api});

  @override
  Future<Weather> getWeather(String city) => api.fetchWeather(city);
}
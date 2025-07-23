import '../IRepository/IWeatherRepo.dart';
import '../entities/weather.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;
  GetWeatherUseCase({required this.repository});

  Future<Weather> call(String city) {
    return repository.getWeather(city);
  }
}
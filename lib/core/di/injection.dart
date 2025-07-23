import 'package:get_it/get_it.dart';

import '../../data/datasources/weather_api_service.dart';
import '../../data/repositories/weatherRepository.dart';
import '../../domain/IRepository/IWeatherRepo.dart';
import '../../domain/usecases/weather_useCase.dart';
import '../../presentation/viewmodels/weather_notifer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Service
  sl.registerLazySingleton<WeatherApiService>(() => WeatherApiService());

  // Repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(api: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetWeatherUseCase(repository: sl()));

  // ViewModel
  sl.registerFactory(() => WeatherNotifier(sl()));
}

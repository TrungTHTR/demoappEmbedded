import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/di/injection.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/weather_useCase.dart';

final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<Weather>>(
    (ref) => WeatherNotifier(ref.read(getItProvider)));

final getItProvider = Provider((_) => sl<GetWeatherUseCase>());

class WeatherNotifier extends StateNotifier<AsyncValue<Weather>> {
  final GetWeatherUseCase useCase;
  WeatherNotifier(this.useCase) : super(const AsyncLoading());

  Future<void> fetch(String city) async {
    state = const AsyncLoading();
    try {
      final w = await useCase(city);
      state = AsyncData(w);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
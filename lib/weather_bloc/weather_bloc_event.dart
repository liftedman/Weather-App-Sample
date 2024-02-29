import 'dart:async';
import 'dart:developer' as developer;

import 'package:weather_m_app/weather_bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherBlocEvent {
  Stream<WeatherBlocState> applyAsync(
      {WeatherBlocState currentState, WeatherBlocBloc bloc});
}

class UnWeatherBlocEvent extends WeatherBlocEvent {
  @override
  Stream<WeatherBlocState> applyAsync({WeatherBlocState? currentState, WeatherBlocBloc? bloc}) async* {
    yield UnWeatherBlocState();
  }
}

class LoadWeatherBlocEvent extends WeatherBlocEvent {
   
  @override
  Stream<WeatherBlocState> applyAsync(
      {WeatherBlocState? currentState, WeatherBlocBloc? bloc}) async* {
    try {
      yield UnWeatherBlocState();
      await Future.delayed(const Duration(seconds: 1));
      yield InWeatherBlocState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadWeatherBlocEvent', error: _, stackTrace: stackTrace);
      yield ErrorWeatherBlocState( _.toString());
    }
  }
}

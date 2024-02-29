import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:weather_m_app/weather_bloc/index.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {

  WeatherBlocBloc(super.initialState){
   on<WeatherBlocEvent>((event, emit) {
      return emit.forEach<WeatherBlocState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'WeatherBlocBloc', error: error, stackTrace: stackTrace);
          return ErrorWeatherBlocState(error.toString());
        },
      );
    });
  }
}

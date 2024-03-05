// import 'dart:async';
// import 'dart:developer' as developer;

// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_m_app/my_data/data.dart';

import 'weather_bloc_event.dart';
import 'weather_bloc_state.dart';
// import 'package:weather_m_app/weather_bloc/index.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
           event.position.latitude, event.position.longitude);
           print(weather);
        emit(WeatherBlocSuccess(weather));
        
      } catch (e) {
        emit(WeatherBlocFailure());
      }

      // return emit.forEach<WeatherBlocState>(
      //   event.applyAsync(currentState: state, bloc: this),
      //   onData: (state) => state,
      //   onError: (error, stackTrace) {
      //     developer.log('$error', name: 'WeatherBlocBloc', error: error, stackTrace: stackTrace);
      //     return ErrorWeatherBlocState(error.toString());
      //   },
      // );
    });
  }
}

// import 'package:equatable/equatable.dart';

// sealed class WeatherBloc extends Equatable {
//   const WeatherBloc();

//   @override
//   List<Object> get props => [];
// }

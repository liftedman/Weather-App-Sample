import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  const WeatherBlocSuccess(this.weather);

  @override
  List<Object> get props => [weather];

}

// /// UnInitialized
// class UnWeatherBlocState extends WeatherBlocState {
//   UnWeatherBlocState();

//   @override
//   String toString() => 'UnWeatherBlocState';
// }

// /// Initialized
// class InWeatherBlocState extends WeatherBlocState {}



//   InWeatherBlocState(this.hello);
  
//   final String hello;

//   @override
//   String toString() => 'InWeatherBlocState $hello';

//   @override
//   List<Object> get props => [hello];
// }

// class ErrorWeatherBlocState extends WeatherBlocState {
//   ErrorWeatherBlocState(this.errorMessage);
 
//   final String errorMessage;
  
//   @override
//   String toString() => 'ErrorWeatherBlocState';

//   @override
//   List<Object> get props => [errorMessage];
// }

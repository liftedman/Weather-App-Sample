import 'package:equatable/equatable.dart';

abstract class WeatherBlocState extends Equatable {
  WeatherBlocState();

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnWeatherBlocState extends WeatherBlocState {

  UnWeatherBlocState();

  @override
  String toString() => 'UnWeatherBlocState';
}

/// Initialized
class InWeatherBlocState extends WeatherBlocState {
  InWeatherBlocState(this.hello);
  
  final String hello;

  @override
  String toString() => 'InWeatherBlocState $hello';

  @override
  List<Object> get props => [hello];
}

class ErrorWeatherBlocState extends WeatherBlocState {
  ErrorWeatherBlocState(this.errorMessage);
 
  final String errorMessage;
  
  @override
  String toString() => 'ErrorWeatherBlocState';

  @override
  List<Object> get props => [errorMessage];
}

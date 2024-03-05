import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_m_app/weather_bloc/weather_bloc_bloc.dart';
// import 'package:weather_m_app/weather_bloc/weather_bloc_event.dart';
import 'package:weather_m_app/weather_bloc/weather_bloc_state.dart';
// import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIconCondition(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          "assets/images/one.png",
          scale: 2.0,
        );
      case >= 300 && < 400:
        return Image.asset(
          "assets/images/six.png",
          scale: 2.0,
        );
      case >= 400 && < 500:
        return Image.asset(
          "assets/images/seven.png",
          scale: 2.0,
        );
      case >= 500 && < 600:
        return Image.asset(
          "assets/images/eight.png",
          scale: 2.0,
        );
      case >= 600 && < 700:
        return Image.asset(
          "assets/images/nine.png",
          scale: 2.0,
        );
      case >= 700 && < 800:
        return Image.asset(
          "assets/images/six.png",
          scale: 2.0,
        );
      case == 800:
        return Image.asset(
          "assets/images/two.png",
          scale: 2.0,
        );
      case > 800 && <= 804:
        return Image.asset(
          "assets/images/eleven.png",
          scale: 2.0,
        );

      default:
        return Image.asset(
          "assets/images/nine.png",
          scale: 2.0,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0.5 * kToolbarHeight, 40, 0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2.4, -0.3),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber[700],
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "📍 ${state.weather.areaName} ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            greeting(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Center(
                            child: getWeatherIconCondition(
                                state.weather.weatherConditionCode!.round()),
                          ),

                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd .')
                                  .add_jm()
                                  .format(state.weather.date!),
                              // 'Friday 16, 13:45',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          //Detail weather information
                          SizedBox(
                            child: Row(
                              // Fisrt Main Row
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // first row in the first main row
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/two.png',
                                      scale: 7,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunrise!),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // Second row in the first main row
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/three.png',
                                      scale: 7,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunset!),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Divider(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          Row(
                            // Main Row
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // first row in the first main row
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/four.png',
                                    scale: 7,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Max',
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              // Second row in the first main row
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/five.png',
                                    scale: 7,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Temp Min',
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        '${state.weather.tempMax!.celsius!.round()}°C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}

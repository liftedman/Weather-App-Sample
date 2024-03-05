
  import 'package:flutter/material.dart';

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
 

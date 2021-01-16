import 'package:flutter/painting.dart';

class Constants {
  static final Constants _singleton = Constants._internal();

  factory Constants() {
    return _singleton;
  }

  Constants._internal();

  static const Color secondaryColor = Color(0xFF2BDA8E);
  static const Color tertiaryColor = Color(0xFFFFE358);
  static const Color blackColor = Color(0xFF323643);
  static const Color greyColor = Color(0xFF9DA3B4);
  static const Color greyColor2 = Color(0xFFC5CCD6);

  static const double baseSize = 16;
  static const double fontSize = 14;
  static const double radiusSize = 6;
  static const double paddingSize = 25;

  static const double h1 = 26;
  static const double h2 = 20;
  static const double h3 = 18;
  static const double title = 18;
  static const double header = 16;
  static const double body = 14;
  static const double caption = 12;

  static const String email = "contact@flutter-ui.com";
  static const String password = "12345678";
}

import 'package:flutter/material.dart';

class GlobalVariables {
  static const primaryColor = Color.fromARGB(255, 1, 32, 115);
  static const backgroundColor = Color.fromARGB(255, 84, 175, 249);
  static const tertiaryColor = Color.fromARGB(255, 144, 145, 245);

  static TextStyle smallText = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w300,
  );

  static TextStyle largeText = TextStyle(
    letterSpacing: 0.1,
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const List<Color> avatarColors = [
    Color(0xFF635BFF),
    Color(0xFF00B894),
    Color(0xFFE17055),
    Color(0xFF0984E3),
    Color(0xFF6C5CE7),
    Color(0xFFE84393),
    Color(0xFFFF7675),
    Color(0xFF00CEC9),
  ];
}

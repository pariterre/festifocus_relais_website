import 'package:flutter/material.dart';

class ThemeManager {
  ///
  /// Prepare the singleton instance
  ///
  static final ThemeManager _instance = ThemeManager._internal();
  static ThemeManager get instance => _instance;
  ThemeManager._internal();

  ///
  /// Theme colors
  ///
  final primaryColor = const Color.fromARGB(255, 0x65, 0x32, 0x8f);
  final secondaryColor = const Color.fromARGB(255, 0x22, 0x27, 0x79);
  final boxBackgroundColor = const Color.fromARGB(255, 0xf0, 0xbc, 0x42);
  final colorButtonSelected = const Color.fromARGB(255, 190, 129, 67);
  final colorButtonUnselected = const Color.fromARGB(255, 233, 196, 159);

  ///
  /// Theme text
  ///
  final _textTheme = const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'BebasNeue',
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'BebasNeue',
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'BebasNeue',
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: 'Nirmala',
      fontSize: 16,
    ),
  );

  ///
  /// Theme data
  ///
  ThemeData get themeData => ThemeData(textTheme: _textTheme);
}

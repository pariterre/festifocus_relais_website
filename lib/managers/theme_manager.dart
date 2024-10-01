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
  final titleColor = const Color.fromARGB(255, 190, 129, 67);
  final primaryColor = const Color.fromARGB(255, 248, 220, 192);
  final secondaryColor = const Color.fromARGB(255, 250, 245, 240);
  final boxBackgroundColor = const Color.fromARGB(255, 179, 91, 4);
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
        fontSize: 28),
    titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'BebasNeue',
        fontSize: 20),
    titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'BebasNeue',
        fontSize: 18),
    bodyMedium:
        TextStyle(color: Colors.black, fontFamily: 'Nirmala', fontSize: 16),
  );

  ///
  /// Theme data
  ///
  ThemeData get themeData => ThemeData(textTheme: _textTheme);
}

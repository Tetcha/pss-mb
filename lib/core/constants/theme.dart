import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  backgroundColor: Colors.grey[200],
  primaryColorLight: Colors.purple,
  primaryColorDark: Colors.black54,
  textTheme: const TextTheme(
    labelSmall: TextStyle(fontSize: 8),
  ),
  fontFamily: 'NunitoSans',
);

class AppTheme {
  static ThemeData getTheme() {
    return defaultTheme;
  }
}

import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  backgroundColor: Colors.grey[200],
  fontFamily: 'NunitoSans',
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.blueAccent,
);

class AppTheme {
  static ThemeData getTheme(MaterialColor? customColor) {
    if (customColor == null) {
      return defaultTheme;
    }
    return ThemeData(
      primarySwatch: customColor,
      backgroundColor: Colors.grey[200],
      fontFamily: 'NunitoSans',
    );
  }
}

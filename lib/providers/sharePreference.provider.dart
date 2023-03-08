import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends GetxController {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceProvider(this._sharedPreference);

  SharedPreferences get instance => _sharedPreference;

  // General Methods: ----------------------------------------------------------
  String? get authToken {
    return _sharedPreference.getString(StoreKey.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(StoreKey.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(StoreKey.authToken);
  }

  // Theme:------------------------------------------------------
  Future<bool> saveColor(MaterialColor color) async {
    return _sharedPreference.setString(StoreKey.colorTheme, color.toString());
  }

  MaterialColor get getColor {
    final String? color = _sharedPreference.getString(StoreKey.colorTheme);
    if (color == null) {
      return Colors.blue;
    }
    return MaterialColor(
      int.parse(color.split('(0x')[1].split(')')[0], radix: 16),
      <int, Color>{
        50: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        100: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        200: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        300: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        400: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        500: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        600: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        700: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        800: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
        900: Color(int.parse(color.split('(0x')[1].split(')')[0], radix: 16)),
      },
    );
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(StoreKey.isDarkMode, value);
  }
}

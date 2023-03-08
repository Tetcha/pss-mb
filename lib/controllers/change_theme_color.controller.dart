import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/theme.controller.dart';

class ChangeThemeColorController extends GetxController {
  final ThemeController themeController = Get.find();
  final List<MaterialColor> colorList = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
  ];
}

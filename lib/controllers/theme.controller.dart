import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';

class ThemeController extends GetxController {
  final SharedPreferenceProvider _sharedPreferenceProvider =
      Get.find<SharedPreferenceProvider>();

  late final Rx<MaterialColor?> _color = Rx<MaterialColor?>(null);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _color.value = _sharedPreferenceProvider.getColor;
  }

  MaterialColor? get color {
    return _color.value;
  }

  void changeColor(MaterialColor? color) {
    _color.value = color;
    _sharedPreferenceProvider.saveColor(color!);
    update();
  }
}

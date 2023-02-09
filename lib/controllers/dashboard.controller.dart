import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/screens/all_doctor.dart';
import 'package:pss_m/screens/home.dart';
import 'package:pss_m/screens/profile.dart';
import 'package:pss_m/screens/setting.dart';

class DashboardController extends GetxController {
  final UserProvider userProvider = Get.find();

  final _currentIndex = 0.obs;
  final List<Widget> widgetList = <Widget>[
    HomeScreen(),
    const AllDoctorScreen(),
    const ProfileScreen(),
    SettingScreen(),
  ];

  int get currentIndex => _currentIndex.value;
  Widget get currentScreen => widgetList[_currentIndex.value];
  bool get isLogin => userProvider.isLogin.value;

  void onChangeTab(int index) {
    print(index);
    switch (index) {
      case 0:
        Get.off(() => HomeScreen());
        break;
      case 1:
        Get.off(() => const AllDoctorScreen());
        break;
      case 2:
        Get.off(() => const ProfileScreen());
        break;
      case 3:
        Get.off(() => SettingScreen());
        break;
      default:
    }
    _currentIndex.value = index;
  }
}

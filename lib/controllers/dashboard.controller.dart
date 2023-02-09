import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/screens/all_doctor.dart';
import 'package:pss_m/screens/home.dart';
import 'package:pss_m/screens/profile.dart';
import 'package:pss_m/screens/setting.dart';
import 'package:pss_m/screens/treatment.dart';

class DashboardController extends GetxController {
  final UserProvider userProvider = Get.find();

  final _currentIndex = 0.obs;
  final List<Widget> widgetList = <Widget>[
    HomeScreen(),
    const AllDoctorScreen(),
    const MyTreatmentScreen(),
    SettingScreen(),
  ];

  int get currentIndex => _currentIndex.value;
  Widget get currentScreen => widgetList[_currentIndex.value];
  bool get isLogin => userProvider.isLogin.value;

  void onChangeTab(int index) {
    _currentIndex.value = index;
  }
}

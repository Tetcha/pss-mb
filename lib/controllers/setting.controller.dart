import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/interface/setting/setting.dart';
import 'package:pss_m/screens/add_balance.dart';
import 'package:pss_m/screens/change_theme_color.dart';
import 'package:pss_m/screens/login.dart';
import 'package:pss_m/screens/profile.dart';

class SettingController extends GetxController {
  final SharedPreferenceProvider preferenceProvider = Get.find();
  final UserProvider userProvider = Get.find();
  late final List<ISettingItem> settingList = [
    ISettingItem(
        title: "Profile",
        icon: Icons.person,
        onTap: () {
          Get.to(
            () => const ProfileScreen(),
            transition: Transition.leftToRight,
          );
        }),
    ISettingItem(
        title: "Theme",
        icon: Icons.color_lens,
        onTap: () {
          Get.to(
            () => const ChangeThemeColorScreen(),
            transition: Transition.leftToRight,
          );
        }),
    ISettingItem(
        title: "Balance",
        icon: Icons.wallet,
        onTap: () {
          Get.to(() => const AddBalanceScreen());
        }),
    ISettingItem(
        title: "Logout",
        icon: Icons.logout,
        onTap: () {
          preferenceProvider.removeAuthToken();
          userProvider.resetData();
          Get.off(() => const LoginScreen());
        }),
  ];
}

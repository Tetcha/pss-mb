import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/widgets/layout/dashboard.dart';

class SettingList {
  String title;
  IconData icon;
  VoidCallback onTap;

  SettingList({required this.title, required this.icon, required this.onTap});
}

class SettingScreen extends StatelessWidget {
  final SharedPreferenceProvider _preferenceProvider = Get.find();
  final UserProvider _userProvider = Get.find();
  late final List<SettingList> _settingList = [
    SettingList(title: "Setting", icon: Icons.settings, onTap: () {}),
    SettingList(title: "Help", icon: Icons.help, onTap: () {}),
    SettingList(title: "About", icon: Icons.info, onTap: () {}),
    SettingList(
        title: "Logout",
        icon: Icons.logout,
        onTap: () {
          _preferenceProvider.removeAuthToken();
          _userProvider.resetData();
        }),
  ];

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return DashBoardLayout(
        children: SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: _settingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_settingList[index].title),
              leading: Icon(_settingList[index].icon),
              onTap: _settingList[index].onTap,
            ),
          );
        },
      ),
    ));
  }
}

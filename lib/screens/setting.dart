import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/setting.controller.dart';
import 'package:pss_m/widgets/User/user_welcome.dart';
import 'package:pss_m/widgets/setting_item/index.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            const UserWelcome(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...controller.settingList
                    .map(
                      (e) => IconLabelWidget(
                        icon: e.icon,
                        label: e.title,
                        onTap: e.onTap,
                      ),
                    )
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/dashboard.controller.dart';
import 'package:pss_m/widgets/auto_login/auto_login.dart';
import 'package:pss_m/widgets/bottom_navigation/index.dart';
import 'package:pss_m/widgets/loading_overlay/index.dart';

class DashBoardLayout extends StatelessWidget {
  const DashBoardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => LoadingOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Psych System'),
          ),
          body: SafeArea(
            child: RepaintBoundary(
              key: const Key("global key"),
              child: SingleChildScrollView(
                child: AutoLogin(
                  children: Obx(() => controller.currentScreen),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Obx(() => controller.isLogin
              ? CBottomNavigationBar(
                  currentIndex: controller.currentIndex,
                  onChangeTab: controller.onChangeTab,
                )
              : const SizedBox()),
        ),
      ),
    );
  }
}

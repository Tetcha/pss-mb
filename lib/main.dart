import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/injection/index.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/screens/all_doctor.dart';
import 'package:pss_m/screens/home.dart';
import 'package:pss_m/screens/profile.dart';
import 'package:pss_m/screens/setting.dart';
import 'package:pss_m/widgets/auto_login/auto_login.dart';
import 'package:pss_m/widgets/bottom_navigation/index.dart';
import 'package:pss_m/widgets/loading_overlay/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  List<Widget> widgetList = <Widget>[
    HomeScreen(),
    const AllDoctorScreen(),
    const ProfileScreen(),
    SettingScreen(),
  ];

  void _onChangeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Get.find();

    return GetMaterialApp(
      title: 'Flutter Base',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[200],
        primaryColorLight: Colors.blue,
        primaryColorDark: Colors.black54,
        textTheme: const TextTheme(
          labelSmall: TextStyle(fontSize: 8),
        ),
      ),
      home: LoadingOverlay(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Psych System'),
          ),
          body: RepaintBoundary(
            key: const Key("global key"),
            child: SingleChildScrollView(
              child: AutoLogin(
                children: widgetList[_currentIndex],
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => userProvider.isLogin.value
                ? CBottomNavigationBar(
                    currentIndex: _currentIndex,
                    onChangeTab: _onChangeTab,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}

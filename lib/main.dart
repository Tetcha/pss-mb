import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/injection/index.dart';
import 'package:pss_m/screens/all_doctor.dart';
import 'package:pss_m/screens/dashboard.dart';
import 'package:pss_m/screens/home.dart';
import 'package:pss_m/screens/login.dart';
import 'package:pss_m/screens/profile.dart';
import 'package:pss_m/screens/setting.dart';

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
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PSS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[200],
        primaryColorLight: Colors.blue,
        primaryColorDark: Colors.black54,
        textTheme: const TextTheme(
          labelSmall: TextStyle(fontSize: 8),
        ),
      ),
      home: const DashBoardLayout(),
    );
  }
}

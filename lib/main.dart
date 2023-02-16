import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/config/firebase.dart';
import 'package:pss_m/core/config/injection.dart';
import 'package:pss_m/screens/dashboard.dart';
import 'package:pss_m/services/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configFirebase();
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
  NotificationService notificationService = Get.find();
  @override
  Widget build(BuildContext context) {
    notificationService.init();
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
        fontFamily: 'NunitoSans',
      ),
      home: const DashBoardLayout(),
    );
  }
}

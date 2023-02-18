import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/config/firebase.dart';
import 'package:pss_m/core/config/injection.dart';
import 'package:pss_m/core/constants/theme.dart';
import 'package:pss_m/screens/dashboard.dart';
import 'package:pss_m/services/notification.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configFirebase();
  await configureDependencies();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await FirebaseMessaging.instance.subscribeToTopic('global');
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permission granted');
  }
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
      theme: AppTheme.getTheme(),
      home: const DashBoardLayout(),
    );
  }
}

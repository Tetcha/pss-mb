import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/theme.controller.dart';
import 'package:pss_m/core/config/firebase.dart';
import 'package:pss_m/core/config/injection.dart';
import 'package:pss_m/core/constants/theme.dart';
import 'package:pss_m/screens/dashboard.dart';
import 'package:pss_m/services/Toast.service.dart';
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
  // join global channel for all users including unauthorized users
  await FirebaseMessaging.instance.subscribeToTopic('global');
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permission granted');
  }

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
  final ThemeController themeController = Get.put(ThemeController());
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final ToastService toastService = Get.find();

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      String path = uri.path;
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty && path == '/add-balance') {
        String? amount = queryParams['amount'];
        toastService.showSuccess(
            "Success pay ${amount}đ to your account, please check your balance");
      }
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    notificationService.init();
    return Obx(
      () => GetMaterialApp(
        title: 'PSS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(themeController.color),
        home: const DashBoardLayout(),
      ),
    );
  }
}

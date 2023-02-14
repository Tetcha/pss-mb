import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/injection/index.dart';
import 'package:pss_m/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        primarySwatch: Colors.pink,
        backgroundColor: Colors.grey[200],
        primaryColorLight: Colors.pink,
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

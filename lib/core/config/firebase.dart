import 'package:firebase_core/firebase_core.dart';
import 'package:pss_m/firebase_options.dart';

Future<void> configFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

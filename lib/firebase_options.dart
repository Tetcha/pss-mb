// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDsgqxFTAzpWi5jO6SqtAvFnuNpNZGk6Vo',
    appId: '1:955612507216:web:8fb0047bc8d59202c8b555',
    messagingSenderId: '955612507216',
    projectId: 'psych-support-system-37213',
    authDomain: 'psych-support-system-37213.firebaseapp.com',
    storageBucket: 'psych-support-system-37213.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNW9A_b8YSLdPT3tS3nFu9w3T-cEmZmQ4',
    appId: '1:955612507216:android:5d4a003c509db7dcc8b555',
    messagingSenderId: '955612507216',
    projectId: 'psych-support-system-37213',
    storageBucket: 'psych-support-system-37213.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEW0cV7VqAmIvLCeWt6GN_Vd7UYc3IIXQ',
    appId: '1:955612507216:ios:5d2827c3b255cdfcc8b555',
    messagingSenderId: '955612507216',
    projectId: 'psych-support-system-37213',
    storageBucket: 'psych-support-system-37213.appspot.com',
    androidClientId: '955612507216-03qrjpnbu79eb33fjafb2ltn3ms27mlk.apps.googleusercontent.com',
    iosClientId: '955612507216-53oi53bdgiq4nj9n5cb5fqi4m8eq75eh.apps.googleusercontent.com',
    iosBundleId: 'com.example.pssm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEW0cV7VqAmIvLCeWt6GN_Vd7UYc3IIXQ',
    appId: '1:955612507216:ios:5d2827c3b255cdfcc8b555',
    messagingSenderId: '955612507216',
    projectId: 'psych-support-system-37213',
    storageBucket: 'psych-support-system-37213.appspot.com',
    androidClientId: '955612507216-03qrjpnbu79eb33fjafb2ltn3ms27mlk.apps.googleusercontent.com',
    iosClientId: '955612507216-53oi53bdgiq4nj9n5cb5fqi4m8eq75eh.apps.googleusercontent.com',
    iosBundleId: 'com.example.pssm',
  );
}
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // request permission for notification
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission granted');
    }

    // token for register specific device
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("divide token $fcmToken");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received notification: ${message.notification?.title}');
    });
  }
}

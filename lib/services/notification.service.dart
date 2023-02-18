import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pss_m/services/Toast.service.dart';

class NotificationService extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  ToastService toastService = Get.find();

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

    // foreground message handle
    // NOTE: only trigger when the app is opening
    // if the app is terminated, by default it will receive as a notification popup on system
    FirebaseMessaging.onMessage.listen((RemoteMessage res) {
      String title = res.notification?.title ?? "";
      toastService.showInfo(title);
    });
  }
}

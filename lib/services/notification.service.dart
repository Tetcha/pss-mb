import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/services/Toast.service.dart';

class NotificationService extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  ToastService toastService = Get.find();
  final UserProvider userProvider = Get.find();
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
      String des = res.notification?.body ?? "";
      print("title $title");
      print("des $des");
      print(des.contains("appointment has been accepted"));
      if (des.contains("appointment has been accepted") == true) {
        print("calling api");
        userProvider.updateUserInfo();
      }
      toastService.showInfo(title);
    });
  }
}

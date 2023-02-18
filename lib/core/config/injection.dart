import 'package:get/get.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/core/api/config.dart';
import 'package:pss_m/core/api/doctor.api.dart';
import 'package:pss_m/core/api/student.api.dart';
import 'package:pss_m/providers/api.provider.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/providers/ui.provider.dart';
import 'package:pss_m/providers/user.provider.dart';

import 'package:pss_m/services/Toast.service.dart';
import 'package:pss_m/services/doctor.service.dart';
import 'package:pss_m/services/facebook.service.dart';
import 'package:pss_m/services/google.service.dart';
import 'package:pss_m/services/notification.service.dart';
import 'package:pss_m/services/student.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// config global dependencies
Future<void> configureDependencies() async {
  // provider
  Get.put(ApiProvider());
  Get.put(UIProvider());
  Get.put(SharedPreferenceProvider(await SharedPreferences.getInstance()));

  // depend singleton
  Get.lazyPut(() => ApiClient());
  Get.lazyPut(() => AuthApi());
  Get.lazyPut(() => StudentApi());
  Get.lazyPut(() => DoctorApi());
  Get.lazyPut(() => UserProvider());

  // services
  Get.put(GoogleService());
  Get.put(FacebookService());
  Get.put(StudentServices());
  Get.put(DoctorService());
  Get.put(ToastService());
  Get.put(NotificationService());
}

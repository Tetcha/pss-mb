import 'package:get/get.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/core/api/config.dart';
import 'package:pss_m/core/api/doctor.api.dart';
import 'package:pss_m/core/api/student.api.dart';
import 'package:pss_m/core/providers/api.provider.dart';
import 'package:pss_m/core/providers/ui.provider.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';
import 'package:pss_m/core/services/Toast.dart';
import 'package:pss_m/core/services/doctor.auth.dart';
import 'package:pss_m/core/services/facebook.auth.dart';
import 'package:pss_m/core/services/google.auth.dart';
import 'package:pss_m/core/services/student.auth.dart';
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
}

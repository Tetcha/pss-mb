import 'package:get/get.dart';
import 'package:pss_m/api/auth.api.dart';
import 'package:pss_m/api/booking.api.dart';
import 'package:pss_m/api/config.dart';
import 'package:pss_m/api/doctor.api.dart';
import 'package:pss_m/api/payment.api.dart';
import 'package:pss_m/api/student.api.dart';
import 'package:pss_m/api/twilio.api.dart';
import 'package:pss_m/providers/api.provider.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/providers/ui.provider.dart';
import 'package:pss_m/providers/user.provider.dart';

import 'package:pss_m/services/Toast.service.dart';
import 'package:pss_m/services/booking.service.dart';
import 'package:pss_m/services/doctor.service.dart';
import 'package:pss_m/services/dynamic_link.service.dart';
import 'package:pss_m/services/facebook.service.dart';
import 'package:pss_m/services/google.service.dart';
import 'package:pss_m/services/notification.service.dart';
import 'package:pss_m/services/payment.service.dart';
import 'package:pss_m/services/student.service.dart';
import 'package:pss_m/services/twilio.service.dart';
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
  Get.lazyPut(() => TwilioApi());
  Get.lazyPut(() => BookingApi());
  Get.lazyPut(() => PaymentApi());
  // services
  Get.put(DynamicLinkService());
  Get.put(GoogleService());
  Get.put(FacebookService());
  Get.put(StudentServices());
  Get.put(DoctorService());
  Get.put(ToastService());
  Get.put(NotificationService());
  Get.put(TwilioService());
  Get.put(BookingService());
  Get.put(PaymentService());
}

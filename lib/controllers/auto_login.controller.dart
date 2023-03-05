import 'package:get/get.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/screens/login.dart';

class AutoLoginController extends GetxController {
  final UserProvider _userProvider = Get.find();
  final SharedPreferenceProvider _sharedPreferenceProvider = Get.find();

  void getCurrentUser() async {
    Student? student = await _userProvider.getCurrentUser();
    if (student == null) Get.off(() => const LoginScreen());
  }

  @override
  void onReady() {
    super.onReady();
    final token = _sharedPreferenceProvider.authToken;
    // prevent to call getCurrentUser() if token is null
    if (token == null) {
      Get.off(() => const LoginScreen());
      return;
    }
    getCurrentUser();
  }
}

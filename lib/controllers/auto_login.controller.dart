import 'package:get/get.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/screens/login.dart';

class AutoLoginController extends GetxController {
  final UserProvider _userProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    (() async {
      Student? student = await _userProvider.getCurrentUser();
      if (student == null) Get.off(() => const LoginScreen());
    })();
  }
}

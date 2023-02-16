import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/screens/dashboard.dart';

class LoginController extends GetxController {
  final UserProvider _userProvider = Get.find();

  final TextEditingController _usernameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  onSubmit() {
    // just auto set for demo
    _userProvider.setIsLogin = true;
  }

  onGoogleSignIn() async {
    bool isLoginSuccess = await _userProvider.loginGoogle();
    if (isLoginSuccess == true) {
      Get.off(() => const DashBoardLayout());
    }
  }

  onFacebookSignIn() async {
    bool isLoginSuccess = await _userProvider.loginFacebook();
    if (isLoginSuccess == true) {
      Get.off(() => const DashBoardLayout());
    }
  }

  get usernameController => _usernameController;
  get passwordController => _passwordController;
}

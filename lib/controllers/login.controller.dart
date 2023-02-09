import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';
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
      Get.off(() => DashBoardLayout());
    }
  }

  onFacebookSignIn() async {
    bool isLoginSuccess = await _userProvider.signInWithFacebook();
    if (isLoginSuccess == true) {
      Get.off(() => DashBoardLayout());
    }
  }

  get usernameController => _usernameController;
  get passwordController => _passwordController;
}

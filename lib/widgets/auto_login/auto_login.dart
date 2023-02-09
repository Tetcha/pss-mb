import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/screens/login.dart';

class AutoLogin extends StatefulWidget {
  final Widget children;

  const AutoLogin({super.key, required this.children});

  @override
  State<AutoLogin> createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  final UserProvider _userProvider = Get.find();

  @override
  initState() {
    super.initState();
    // uncomment for auto login on app start
    _userProvider.getCurrentUser().then(
          (student) => {
            if (student == null)
              {_userProvider.setIsLogin = false, Get.off(LoginScreen())}
            else
              _userProvider.setIsLogin = true
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _userProvider.isLogin.value
          ? widget.children
          : const Center(
              child: Text('Unauthorize'),
            ),
    );
  }
}

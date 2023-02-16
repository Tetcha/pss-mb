import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/auto_login.controller.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/widgets/Redirect/redirect_to_login.dart';

class AutoLogin extends StatelessWidget {
  final Widget children;
  final UserProvider _userProvider = Get.find();

  AutoLogin({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AutoLoginController>(
      init: AutoLoginController(),
      builder: (controller) => Obx(
        () => _userProvider.isLogin.value ? children : const RedirectToLogin(),
      ),
    );
  }
}

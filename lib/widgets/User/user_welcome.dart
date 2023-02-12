import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/user_welcome.controller.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserWelcomeController>(
      init: UserWelcomeController(),
      builder: (controller) => Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              controller.avatarUrl,
            ),
          ),
        ],
      ),
    );
  }
}

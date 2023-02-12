import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/user_welcome.controller.dart';
import 'package:pss_m/core/constants/style.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserWelcomeController>(
      init: UserWelcomeController(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(
                controller.avatarUrl ?? "",
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.name,
                style: const TextStyle(
                  fontSize: StyleTheme.bigTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Balance: ${controller.balance} VNĐ",
                style: TextStyle(
                  fontSize: StyleTheme.helperTextSize,
                  color: StyleTheme.helperTextColor,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

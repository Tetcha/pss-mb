import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/api.provider.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Get.find();
    final String error = apiProvider.errorDetails['errorMessage'] ?? '';
    return error != ''
        ? Align(
            alignment: Alignment.topLeft,
            child: Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
          )
        : const SizedBox.shrink();
  }
}

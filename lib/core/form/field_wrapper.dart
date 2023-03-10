import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/form/field_wrapper.dart';

class FieldWrapper extends StatelessWidget {
  final String name;
  final Widget child;
  const FieldWrapper({super.key, required this.child, required this.name});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FieldWrapperController>(
      init: FieldWrapperController(),
      builder: (controller) => Column(
        children: [
          child,
          Obx(() {
            return controller.apiProvider.errorDetails[name] != null
                ? const SizedBox(height: 10)
                : const SizedBox.shrink();
          }),
          Obx(
            () => controller.apiProvider.errorDetails[name] != null
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      controller.apiProvider.errorDetails[name] ?? "",
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

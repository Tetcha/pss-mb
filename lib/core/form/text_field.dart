import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/providers/api.provider.dart';

class TextFieldC extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final String name;
  final dynamic defaultValue;
  final String hintText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic context;
  final bool disabled;
  final Function()? onTap;
  final String? initialValue;
  late ApiProvider apiProvider;
  TextFieldC({
    super.key,
    this.controller,
    this.label = '',
    this.name = '',
    this.defaultValue = '',
    this.hintText = '',
    this.isPassword = false,
    this.keyBoardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.context,
    this.disabled = false,
    this.onTap,
    this.initialValue,
  }) {
    apiProvider = Get.find();
  }
  get error => apiProvider.errorDetails[name];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FormBuilderTextField(
        name: name,
        initialValue: initialValue,
        enabled: !disabled,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyBoardType,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: StyleTheme.formTitleColor,
          ),
          errorText: error,
          prefixIcon: prefixIcon,
          suffixIcon: prefixIcon,
        ),
      ),
    );
  }
}

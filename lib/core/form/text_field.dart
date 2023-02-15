import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/form/text_field.controller.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/form/field_wrapper.dart';

class TextFieldC extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final String error;
  final String name;
  final dynamic defaultValue;
  final String hintText;
  final TextInputType keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final dynamic context;
  final bool disabled;

  const TextFieldC({
    super.key,
    this.controller,
    this.error = '',
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
  });

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      name: name,
      child: GetBuilder<TextFieldController>(
        init: TextFieldController(),
        builder: (thisController) => TextField(
          enabled: !disabled,
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyBoardType == TextInputType.datetime
              ? TextInputType.none
              : keyBoardType,
          onTap: keyBoardType == TextInputType.datetime
              ? () => thisController.presentDatePicker(
                    context,
                    defaultValue,
                    controller,
                  )
              : null,
          decoration: InputDecoration(
            // border: const UnderlineInputBorder(),
            labelText: label,
            labelStyle: TextStyle(
              color: StyleTheme.formTitleColor,
            ),
            hintText: hintText,
            prefixIcon: suffixIcon,
            suffixIcon: keyBoardType == TextInputType.datetime
                ? GestureDetector(
                    onTap: () => thisController.presentDatePicker(
                      context,
                      defaultValue,
                      controller,
                    ),
                    child:
                        prefixIcon ?? const Icon(Icons.calendar_today_rounded),
                  )
                : prefixIcon,
          ),
        ),
      ),
    );
  }
}

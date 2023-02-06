import 'package:flutter/material.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/extensions/string.dart';

class FieldTitle extends StatelessWidget {
  final String label;
  const FieldTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.capitalize(),
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: StyleTheme.formTitleSize,
        color: StyleTheme.formTitleColor,
      ),
    );
  }
}

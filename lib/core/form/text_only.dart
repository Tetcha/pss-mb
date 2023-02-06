import 'package:flutter/material.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/form/title.dart';

class TextOnly extends StatelessWidget {
  final String label;
  final String value;
  const TextOnly({super.key, this.label = '', this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        FieldTitle(label: label),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: StyleTheme.textSize,
          ),
        ),
      ],
    );
  }
}

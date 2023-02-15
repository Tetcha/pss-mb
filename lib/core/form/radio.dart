import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/form/radio.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/form/field_wrapper.dart';
import 'package:pss_m/core/form/title.dart';
import 'package:pss_m/interface/form/radio/radio_data.dart';

class RadioC<T> extends StatelessWidget {
  final String label;
  final List<IRadioData<T>> options;
  Function(T value)? onInputChange;
  final T? defaultValue;
  String name;
  RadioC({
    super.key,
    this.label = '',
    this.options = const [],
    this.onInputChange,
    this.defaultValue,
    this.name = '',
  });

  @override
  Widget build(BuildContext context) {
    return FieldWrapper(
      name: name,
      child: GetBuilder<RadioController<T>>(
        init: RadioController<T>(
          label: label,
          options: options,
          onInputChange: onInputChange,
          defaultValue: defaultValue,
          name: name,
        ),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 5),
            FieldTitle(label: label),
            const SizedBox(height: 5),
            Column(
              children: options
                  .map(
                    (element) => Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Radio<T>(
                            value: element.value,
                            groupValue: controller.radioValue.value,
                            onChanged: controller.handleRadioValueChange,
                          ),
                        ),
                        Text(
                          element.label,
                          style: const TextStyle(
                            fontSize: StyleTheme.textSize,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/api.provider.dart';

class RadioField<T> extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final Function(T value)? onInputChange;
  final T? defaultValue;
  final Axis wrapDirection;
  final OptionsOrientation orientation;
  final TextDirection? wrapTextDirection;
  final T? initialValue;
  final String name;
  final List<FormBuilderFieldOption<T>> options;
  final void Function(T?)? onChanged;
  final ControlAffinity controlAffinity;
  late ApiProvider apiProvider;
  RadioField({
    super.key,
    this.controller,
    this.label = '',
    required this.options,
    this.onInputChange,
    this.defaultValue,
    this.wrapDirection = Axis.horizontal,
    this.orientation = OptionsOrientation.wrap,
    this.wrapTextDirection,
    this.initialValue,
    this.name = '',
    this.onChanged,
    this.controlAffinity = ControlAffinity.leading,
  }) {
    apiProvider = Get.find();
  }
  get error => apiProvider.errorDetails[name];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FormBuilderRadioGroup<T>(
        wrapDirection: wrapDirection,
        orientation: orientation,
        wrapTextDirection: wrapTextDirection,
        decoration: InputDecoration(
          labelText: label,
          errorText: error,
          border: InputBorder.none,
        ),
        initialValue: initialValue,
        name: name,
        onChanged: onChanged,
        options: options,
      ),
    );
  }
}

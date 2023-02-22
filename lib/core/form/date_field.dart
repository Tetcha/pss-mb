import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/providers/api.provider.dart';

class DateField extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final DatePickerEntryMode initialEntryMode;
  final DateTime? initialValue;
  final InputType inputType;
  final String? labelText;
  final Widget? suffixIcon;
  final TimeOfDay initialTime;
  late ApiProvider apiProvider;
  DateField({
    super.key,
    this.controller,
    required this.name,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.initialValue,
    this.inputType = InputType.date,
    required this.labelText,
    this.suffixIcon,
    this.initialTime = const TimeOfDay(hour: 8, minute: 0),
  }) {
    apiProvider = Get.find();
  }
  final _formKey = GlobalKey<FormBuilderState>();
  get error => apiProvider.errorDetails[name];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FormBuilderDateTimePicker(
        controller: controller,
        name: name,
        initialEntryMode: initialEntryMode,
        initialValue: initialValue,
        inputType: inputType,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: error,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: () {
              _formKey.currentState!.fields[name]?.didChange(null);
            },
          ),
        ),
        initialTime: initialTime,
      ),
    );
  }
}

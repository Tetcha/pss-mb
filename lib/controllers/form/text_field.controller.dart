import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pss_m/util/date.dart';

class TextFieldController<T> extends GetxController {
  void presentDatePicker(BuildContext? context, dynamic defaultValue,
      TextEditingController? controller) {
    if (context != null) {
      showDatePicker(
        context: context,
        initialDate: defaultValue == ''
            ? DateTime.now()
            : DateUtil.fromString(defaultValue),
        firstDate: DateTime(1900),
        lastDate: DateTime(2077),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        controller?.text = DateFormat.yMd().format(pickedDate);
      });
      update();
    } else {
      // ignore: avoid_print
      print('context is null');
    }
  }
}

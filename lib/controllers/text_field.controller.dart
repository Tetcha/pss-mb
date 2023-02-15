import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pss_m/util/date.dart';

class TextFieldController extends GetxController {
  void presentDatePicker(dynamic context, dynamic defaultValue,
      TextEditingController? controller) {
    if (context != null) {
      showDatePicker(
        context: context,
        initialDate: DateUtil.fromString(defaultValue),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }

        controller?.text = DateFormat.yMd().format(pickedDate);
      });
    } else {
      // ignore: avoid_print
      print('context is null');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastService extends GetxService {
  void showSuccess(String message) {
    Get.snackbar("Success", message,
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  void showError(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  void showInfo(String message) {
    Get.snackbar("Info", message,
        backgroundColor: Colors.blue, colorText: Colors.white);
  }

  void showWarning(String message) {
    Get.snackbar("Warning", message,
        backgroundColor: Colors.yellow, colorText: Colors.white);
  }
}

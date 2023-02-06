import 'package:get/get.dart';

class ApiProvider extends GetxController {
  RxBool isGlobalLoading = false.obs;
  RxBool isLocalLoading = false.obs;
  RxMap<String, String> errorDetails = RxMap<String, String>();
  bool isError = false;
  String? message;
  String? errorMessage;

  set setGlobalLoading(bool value) {
    isGlobalLoading.value = value;
  }

  set setLocalLoading(bool value) {
    isLocalLoading.value = value;
  }

  void clearErrorDetails() {
    errorDetails.value = {};
  }

  void setErrorDetails(Map<String, String> data) {
    errorDetails.value = data;
  }

  String? getErrorByField(String field) {
    return errorDetails[field];
  }
}

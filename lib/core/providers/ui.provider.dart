import 'package:get/get.dart';

class UIProvider extends GetxController {
  RxBool isLoading = false.obs;
  String title = 'Schedule App';

  set setIsLoading(bool isLoading) {
    this.isLoading.value = isLoading;
    update();
  }
}

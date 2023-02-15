import 'package:get/get.dart';
import 'package:pss_m/core/providers/api.provider.dart';

class FieldWrapperController extends GetxController {
  late ApiProvider apiProvider;

  @override
  void onInit() {
    super.onInit();
    apiProvider = Get.find();
  }
}

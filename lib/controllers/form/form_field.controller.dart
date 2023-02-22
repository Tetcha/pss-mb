import 'package:get/get.dart';
import 'package:pss_m/providers/api.provider.dart';

class TextFieldCopyController extends GetxController {
  late ApiProvider apiProvider;
  String name;
  TextFieldCopyController({required this.name});

  @override
  void onInit() {
    super.onInit();
    apiProvider = Get.find();
  }

  get error => apiProvider.errorDetails[name];
}

import 'package:get/get.dart';
import 'package:pss_m/api/payment.api.dart';
import 'package:pss_m/core/constants/dynamic_link.dart';
import 'package:pss_m/services/dynamic_link.service.dart';

class PaymentService extends GetxService {
  DynamicLinkService dynamicLinkService = Get.find();
  PaymentApi paymentApi = Get.find();

  Future<String?> addBalance(String amount) async {
    try {
      final link = await dynamicLinkService
          .createDynamicLink(DynamicLink.generatePaymentSuccessLink(amount));
      print("redirect created: $link");
      final response = await paymentApi.addBalance(
        amount: int.parse(amount),
        redirectUrl: link.toString(),
      );
      return response.data;
    } catch (e) {
      print('error on call api addBalance: $e');
      return null;
    }
  }
}

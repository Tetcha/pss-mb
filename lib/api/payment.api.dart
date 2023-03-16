import 'package:get/get.dart' hide Response;
import 'package:pss_m/api/config.dart' show ApiClient;

class PaymentApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<dynamic> addBalance(
      {required int amount, required String redirectUrl}) async {
    try {
      final response = await _apiClient.http.post('/transaction', data: {
        'amount': amount,
        'redirectUrl': redirectUrl,
      });
      return response;
    } catch (e) {
      print('error on call api addBalance: $e');
      return null;
    }
  }
}

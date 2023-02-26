import 'package:get/get.dart' hide Response;
import 'package:pss_m/api/config.dart' show ApiClient;

class BookingApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<dynamic> bookSlot({
    required String slotId,
    required List<String> questionContent,
  }) async {
    try {
      final response = await _apiClient.http.post(
        '/bookings',
        data: {
          'slotId': slotId,
          'questionContent': questionContent,
        },
      );

      return response;
    } catch (e) {
      print('error on call api bookSlot: $e');
      return null;
    }
  }
}

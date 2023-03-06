import 'package:get/get.dart' hide Response;
import 'package:pss_m/api/config.dart' show ApiClient;
import 'package:pss_m/core/models/Booking/booking.dart';
import 'package:pss_m/providers/user.provider.dart';

class BookingApi extends GetxService {
  final ApiClient _apiClient = Get.find();
  final UserProvider _userProvider = Get.find();
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

  Future<List<Booking>?> getMyBooking() async {
    try {
      final response = await _apiClient.http.get(
          '/student/${_userProvider.user.id}/bookings',
          queryParameters: {'pageSize': 999, 'order': 'DESC'});
      return (response.data['data'] as List)
          .map((e) => Booking.fromJson(e))
          .toList();
    } catch (e) {
      print('error on call api getMyBooking: $e');
      return null;
    }
  }
}

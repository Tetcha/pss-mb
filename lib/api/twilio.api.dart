import 'package:get/get.dart';
import 'package:pss_m/api/config.dart';

class TwilioApi {
  final ApiClient _apiClient = Get.find();

  Future<String> createToken(
      {required String identity, required String roomName}) async {
    try {
      final response = await _apiClient.http
          .post<Map<String, dynamic>>('/twilio/token', data: {
        'user_identity': identity,
        'room_name': roomName,
      });

      return response.data?['token'];
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }
}

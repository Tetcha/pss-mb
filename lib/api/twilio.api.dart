import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/api/config.dart';

class TwilioApi {
  final ApiClient _apiClient = Get.find();

  Future<String> createToken(String identity) async {
    try {
      final response = await _apiClient.http
          .post<Map<String, dynamic>>('/twilio/token', data: {
        'user_identity': 'duc_dauuu',
        'room_name': "test-room",
      });

      return response.data?['token'];
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }
}

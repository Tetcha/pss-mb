import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pss_m/core/api/config.dart' show ApiClient;
import 'package:pss_m/interface/api/auth/login/login.api.dart';

class AuthApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<String?> login(LoginApiPayload payload) async {
    try {
      final response =
          await _apiClient.http.post<String>('/student/login', data: {
        "accessToken": payload.accessToken,
      });
      return response.data;
    } catch (e) {
      print("login error $e");
      return null;
    }
  }

  Future<Response<Map<String, dynamic>>> getCurrentUser() {
    return _apiClient.http.get('/student/me');
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:pss_m/core/api/config.dart' show ApiClient;
import 'package:pss_m/interface/api/login.api.dart';

class AuthApi {
  final ApiClient _apiClient = Get.find();

  Future<dynamic> login(LoginApiPayload payload) async {
    try {
      final response = await _apiClient.http.post('/student/login', data: {
        "accessToken": payload.accessToken,
      });
      print("response $response");

      return response;
    } catch (e) {
      print("login error $e");
      return null;
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      final response = await _apiClient.http.get('/users/me');
      return response;
    } catch (e) {
      return null;
      return null;
    }
  }
}

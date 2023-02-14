import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pss_m/core/api/config.dart' show ApiClient;
import 'package:pss_m/interface/api/student/update_student/update_student.dart';

class StudentApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<Response<Map<String, dynamic>>?> updateUser(
      UpdateStudentPayload payload) async {
    try {
      final response = await _apiClient.http.put<Map<String, dynamic>>(
          '/student',
          data: json.encode(payload.toJson()));
      return response;
    } catch (e) {
      print("error on update user api: $e");
      return null;
    }
  }
}

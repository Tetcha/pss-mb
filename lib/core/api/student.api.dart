import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pss_m/core/api/config.dart' show ApiClient;
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/interface/api/student/update_student/update_student.dart';

class StudentApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<Response<Student>?> updateUser(UpdateStudentPayload payload) async {
    try {
      final response = await _apiClient.http
          .put<Student>('/student', data: json.encode(payload.toJson()));
      print("api $response");
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

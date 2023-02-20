import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pss_m/api/config.dart' show ApiClient;
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/api/common.dart';
import 'package:pss_m/interface/api/doctor/doctor_filter/doctor_filter.dart';
import 'package:pss_m/interface/api/slot/slot.dart';

class DoctorApi extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<FilterResponse<Doctor>?> getDoctorList(
      DoctorFilterPayload payload) async {
    try {
      final response = await _apiClient.http
          .get('/doctors', queryParameters: payload.toJson());

      FilterResponse<Doctor> doctorList = FilterResponse(
        count: response.data['count'],
        data: (response.data['data'] as List)
            .map((e) => Doctor.fromJson(e))
            .toList(),
      );

      return doctorList;
    } catch (e) {
      print('error on call api getDoctorList: $e');
      return null;
    }
  }

  Future<List<Slot>?> getDoctorSlots({
    required String doctorId,
    required String to,
    required String from,
  }) async {
    try {
      final response = await _apiClient.http
          .get('/doctor/$doctorId/slots', queryParameters: {
        'to': to,
        'from': from,
        'id': doctorId,
      });

      return (response.data as List).map((e) => Slot.fromJson(e)).toList();
    } catch (e) {
      print('error on call api getDoctorSlots: $e');
      return null;
    }
  }
}

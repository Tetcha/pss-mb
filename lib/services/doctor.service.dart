import 'package:get/get.dart';
import 'package:pss_m/api/doctor.api.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/api/common.dart';
import 'package:pss_m/interface/api/doctor/doctor_filter/doctor_filter.dart';

class DoctorService extends GetxService {
  final DoctorApi _doctorApi = Get.find();

  Future<FilterResponse<Doctor>?> getDoctorList(
      DoctorFilterPayload payload) async {
    try {
      final response = await _doctorApi.getDoctorList(payload);
      return response;
    } catch (e) {
      return null;
    }
  }
}

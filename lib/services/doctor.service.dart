import 'package:get/get.dart';
import 'package:pss_m/api/doctor.api.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/api/common.dart';
import 'package:pss_m/interface/api/doctor/doctor_filter/doctor_filter.dart';
import 'package:pss_m/interface/api/slot/slot.dart';

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

  Future<List<Slot>?> getDoctorSlotsById({
    required String doctorId,
    required String from,
    required String to,
  }) async {
    try {
      final response = await _doctorApi.getDoctorSlots(
        doctorId: doctorId,
        from: from,
        to: to,
      );
      return response;
    } catch (e) {
      print("Error on getDoctorSlotsById service: $e");
      return null;
    }
  }
}

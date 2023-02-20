import 'package:get/get.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/services/doctor.service.dart';

class DoctorScheduleController extends GetxController {
  final DoctorService _doctorService = Get.find();
  List<Slot> data = [];
  String doctorId;
  DoctorScheduleController({required this.doctorId});

  @override
  void onInit() {
    super.onInit();
    _doctorService
        .getDoctorSlotsById(
      doctorId: doctorId,
      from: "2020-01-01T00:00:00.000Z",
      to: "2077-01-01T00:00:00.000Z",
    )
        .then((value) {
      if (value != null) {
        data = value;
        update();
      }
    });
  }
}

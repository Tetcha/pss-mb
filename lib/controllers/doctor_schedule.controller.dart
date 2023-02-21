import 'package:get/get.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/services/doctor.service.dart';
import 'package:pss_m/util/date.dart';

class DoctorScheduleController extends GetxController {
  final DoctorService _doctorService = Get.find();
  bool isFetchedData = false;
  Doctor doctor;
  late var data = <Slot>[];
  DoctorScheduleController({required this.doctor});

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();

    List<Slot>? slots = await _doctorService.getDoctorSlotsById(
      doctorId: doctor.id,
      from: "2023-01-01T00:00:00.000Z",
      to: "2077-01-01T00:00:00.000Z",
    );
    if (slots != null) {
      data.addAll(slots);

      isFetchedData = true;
      update();
    }
  }
}

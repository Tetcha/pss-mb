import 'package:get/get.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/services/doctor.service.dart';
import 'package:pss_m/util/date.dart';

class DoctorScheduleController extends GetxController {
  final DoctorService _doctorService = Get.find();
  Doctor doctor;
  late var data = <Slot>[
    Slot(
      id: "12",
      createAt: "123",
      updateAt: "123",
      startTime: "10:00",
      endTime: "11:00",
      date: DateUtil.toText(DateTime.now()),
      status: true,
      doctor: doctor,
    ),
    Slot(
      id: "12",
      createAt: "123",
      updateAt: "123",
      startTime: "11:00",
      endTime: "12:00",
      date: DateUtil.toText(DateTime.now()),
      status: true,
      doctor: doctor,
    )
  ].obs;
  DoctorScheduleController({required this.doctor});

  @override
  void onInit() {
    super.onInit();
  }

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
      // data.add(Slot(
      //     id: "1",
      //     createAt: "",
      //     updateAt: "",
      //     startTime: "00:00",
      //     endTime: "1:00",
      //     date: DateUtil.toText(DateTime.now()),
      //     status: true,
      //     doctor: doctor));
      // data.addAll(slots);
      update();
    }
  }
}

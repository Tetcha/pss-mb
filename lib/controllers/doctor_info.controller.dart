import 'package:get/get.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/util/date.dart';

class DoctorInfoController extends GetxController {
  Doctor? doctor;
  DoctorInfoController({required this.doctor});

  get doctorName => doctor?.name ?? "";
  get doctorAge {
    if (doctor?.birthday == null) return "";
    return DateUtil.calculateAgeWithServerString(doctor?.birthday).toString();
  }
}

import 'package:get/get.dart';
import 'package:pss_m/screens/doctor_info.dart';

class TreatmentDetailController extends GetxController {
  void onDoctorTap() {
    Get.to(() => DoctorInfo(doctorId: ""));
  }

  void onJoinMeetingTap() {
    // join meeting
  }
}

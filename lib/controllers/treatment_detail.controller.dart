import 'package:get/get.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/screens/conference/conference_screen.dart';
import 'package:pss_m/screens/doctor_info.dart';
import 'package:pss_m/services/twilio.service.dart';

class TreatmentDetailController extends GetxController {
  final TwilioService _twilioService = Get.find();
  final UserProvider _userProvider = Get.find();
  void onDoctorTap() {
    Get.to(() => DoctorInfo(doctorId: ""));
  }

  void onJoinMeetingTap() async {
    // join meeting
    String accessToken = await _twilioService.createToken(
      identity: _userProvider.currentUser.value.name,
      roomName: "test-room",
    );
    Get.to(() => ConferenceScreen(
          identify: _userProvider.currentUser.value.name,
          token: accessToken,
          name: _userProvider.currentUser.value.name,
        ));
  }
}

import 'package:get/get.dart';
import 'package:pss_m/core/models/Booking/booking.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/screens/conference/conference_screen.dart';
import 'package:pss_m/screens/doctor_schedule.dart';
import 'package:pss_m/services/twilio.service.dart';

class TreatmentDetailController extends GetxController {
  final TwilioService _twilioService = Get.find();
  final UserProvider _userProvider = Get.find();
  final Booking booking;
  TreatmentDetailController({required this.booking});
  void onDoctorTap(Doctor? doctor) {
    if (doctor == null) {
      print("doctor info is null");
      return;
    }

    Get.to(() => DoctorScheduleScreen(doctor: doctor));
  }

  void onJoinMeetingTap() async {
    // join meeting
    String accessToken = await _twilioService.createToken(
      identity: _userProvider.currentUser.value.name,
      roomName: "test-room",
      bookingId: booking.id,
    );
    Get.to(() => ConferenceScreen(
          identify: _userProvider.currentUser.value.name,
          token: accessToken,
          name: _userProvider.currentUser.value.name,
        ));
  }
}

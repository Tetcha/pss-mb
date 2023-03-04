import 'package:get/get.dart';
import 'package:pss_m/core/models/Booking/booking.dart';
import 'package:pss_m/screens/treatment_detail.dart';
import 'package:pss_m/services/booking.service.dart';

class MyTreatmentController extends GetxController {
  BookingService bookingService = BookingService();
  List<Booking> myBookingList = [];
  void getMyBookingList() async {
    List<Booking>? list = await bookingService.getMyBooking();
    if (list == null) {
      myBookingList = [];
      return;
    }

    myBookingList = list;
    update();
  }

  void onBookingTap(Booking booking) {
    Get.to(() => TreatmentDetail(
          booking: booking,
        ));
  }

  @override
  void onInit() {
    super.onInit();
    getMyBookingList();
  }
}

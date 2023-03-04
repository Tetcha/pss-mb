import 'package:get/get.dart';
import 'package:pss_m/api/booking.api.dart';
import 'package:pss_m/core/models/Booking/booking.dart';

class BookingService extends GetxService {
  final BookingApi _bookingApi = Get.find();
  Future<dynamic> bookSlot(
      {required String slotId, required List<String> questionContent}) {
    return _bookingApi.bookSlot(
        slotId: slotId, questionContent: questionContent);
  }

  Future<List<Booking>?> getMyBooking() async {
    var response = await _bookingApi.getMyBooking();
    return response;
  }
}

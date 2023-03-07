import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/api/twilio.api.dart';
import 'package:pss_m/services/Toast.service.dart';

class TwilioService extends GetxService {
  final ToastService _toastService = Get.find();
  final TwilioApi _twilioApi = Get.find();
  Future<String?> createToken(
      {required String identity,
      required String roomName,
      required String bookingId}) async {
    try {
      final accessToken = await _twilioApi.createToken(
        identity: identity,
        roomName: roomName,
        bookingId: bookingId,
      );
      return accessToken;
    } catch (e) {
      if (e is DioError) {
        //handle DioError here by error type or by error code
        _toastService.showError(e.response?.data['message']);
      }

      return null;
    }
  }
}

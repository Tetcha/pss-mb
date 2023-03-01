import 'package:get/get.dart';
import 'package:pss_m/api/twilio.api.dart';

class TwilioService extends GetxService {
  final TwilioApi _twilioApi = Get.find();
  Future<dynamic> createToken(
      {required String identity, required String roomName}) async {
    try {
      final accessToken =
          await _twilioApi.createToken(identity: identity, roomName: roomName);
      return accessToken;
    } catch (e) {
      print("error on twilio service $e");
      return null;
    }
  }
}

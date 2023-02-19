import 'package:get/get.dart';
import 'package:pss_m/api/twilo.api.dart';

class TwilioService extends GetxService {
  final TwilioApi _twilioApi = Get.find();
  Future<dynamic> createToken(String identity) async {
    try {
      final accessToken = await _twilioApi.createToken(identity);
      return accessToken;
    } catch (e) {
      print("error on twilio service $e");
      return null;
    }
  }
}

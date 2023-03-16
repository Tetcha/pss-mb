import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/services/payment.service.dart';
import 'package:url_launcher/url_launcher.dart';

class AddWalletController extends GetxController {
  String momoLogoUrl =
      "https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png";
  TextEditingController amountController = TextEditingController();
  PaymentService paymentService = Get.find();
  void onHandleSubmit() async {
    final redirectUrl = await paymentService.addBalance(amountController.text);
    if (redirectUrl == null) {
      return;
    }

    launch(redirectUrl);
  }
}

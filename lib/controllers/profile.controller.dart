import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';

class ProfileController extends GetxController {
  final UserProvider _userProvider = Get.find();
  late final TextEditingController studentCodeController =
      TextEditingController(text: _userProvider.currentUser.value.studentCode);
  late final TextEditingController phoneController =
      TextEditingController(text: _userProvider.currentUser.value.phone);
  late final TextEditingController birthdayController =
      TextEditingController(text: _userProvider.currentUser.value.birthday);
  String? genderValue;

  onClear() {
    studentCodeController.text = _userProvider.currentUser.value.name;
  }

  onSubmit() async {
    print(studentCodeController.value.text);
    print(genderValue);
  }

  onGenderChange(String? value) {
    genderValue = value;
  }
}

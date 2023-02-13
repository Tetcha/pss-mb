import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/core/providers/user.provider.dart';
import 'package:pss_m/core/services/student.auth.dart';
import 'package:pss_m/interface/api/student/update_student/update_student.dart';

class ProfileController extends GetxController {
  final UserProvider _userProvider = Get.find();
  final StudentServices _studentServices = Get.find();
  late final TextEditingController emailController =
      TextEditingController(text: _userProvider.currentUser.value.email);
  late final TextEditingController studentCodeController =
      TextEditingController(text: _userProvider.currentUser.value.studentCode);
  late final TextEditingController phoneController =
      TextEditingController(text: _userProvider.currentUser.value.phone);
  late final TextEditingController birthdayController =
      TextEditingController(text: _userProvider.currentUser.value.birthday);

  Gender? genderValue;

  String? get avatarUrl => _userProvider.userAvatarUrl;

  String get name => _userProvider.currentUser.value.name;

  onClear() {
    studentCodeController.text = _userProvider.currentUser.value.name;
  }

  onSubmit() async {
    UpdateStudentPayload payload = new UpdateStudentPayload(
      name: name,
      email: emailController.text,
      phone: phoneController.text,
      birthday: birthdayController.text,
      gender: genderValue,
      studentCode: studentCodeController.text,
    );

    Student? student = await _studentServices.updateUser(payload);
    print("studet $student");
  }

  onGenderChange(Gender? value) {
    genderValue = value;
  }
}

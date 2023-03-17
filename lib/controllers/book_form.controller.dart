import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pss_m/interface/calendar/calendar.dart';
import 'package:pss_m/providers/user.provider.dart';
import 'package:pss_m/services/Toast.service.dart';
import 'package:pss_m/services/booking.service.dart';

class BookFormController extends GetxController {
  final UserProvider _userProvider = Get.find();
  final BookingService _bookingService = Get.find();
  final ToastService _toastService = Get.find();
  Event currentEvent;
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  BookFormController({required this.currentEvent});
  TextEditingController controller = TextEditingController();
  int questionCount = 1;
  get name => _userProvider.user.name;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    formKey.currentState!.save();
  }

  void onFormChange() {
    formKey.currentState!.save();
    debugPrint(formKey.currentState!.value.toString());
  }

  void addQuestion() {
    questionCount++;
    update();
  }

  void onSubmit() async {
    final List<String?> questionList =
        List<int>.generate(questionCount, (index) => index + 1)
            .map((e) => formKey.currentState!.value["question_$e"] as String?)
            .toList();

    List<String> convertedQuestionList =
        questionList.whereType<String>().toList();
    try {
      var response = await _bookingService.bookSlot(
        slotId: currentEvent.slotId,
        questionContent: convertedQuestionList,
      );
      if (response == null) return;

      Get.back();
      _toastService.showSuccess(
          "Booking success, please wait for confirmation from doctor");
    } catch (e) {
      print("error $e");
    }
  }
}

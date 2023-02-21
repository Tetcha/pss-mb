import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/interface/api/slot/slot.dart';
import 'package:pss_m/interface/calendar/calendar.dart';

class BookFormController extends GetxController {
  Event currentEvent;
  BookFormController({required this.currentEvent});
  TextEditingController controller = TextEditingController();
}

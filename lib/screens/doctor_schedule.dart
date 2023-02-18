import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/doctor_schedule.controller.dart';
import 'package:pss_m/widgets/schedule/schedule.dart';

class DoctorScheduleScreen extends StatelessWidget {
  const DoctorScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorScheduleController>(
      init: DoctorScheduleController(),
      builder: (controller) => Calendar(),
    );
  }
}

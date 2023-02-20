import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/doctor_schedule.controller.dart';
import 'package:pss_m/widgets/calendar/calendar.dart';

class DoctorScheduleScreen extends StatelessWidget {
  String doctorId;
  DoctorScheduleScreen({Key? key, required this.doctorId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dau Le Duc'),
      ),
      body: GetBuilder<DoctorScheduleController>(
        init: DoctorScheduleController(doctorId: doctorId),
        builder: (controller) => Calendar(data: controller.data),
      ),
    );
  }
}

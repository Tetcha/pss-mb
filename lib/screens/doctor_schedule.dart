import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/doctor_schedule.controller.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/widgets/calendar/calendar.dart';

class DoctorScheduleScreen extends StatelessWidget {
  Doctor doctor;
  DoctorScheduleScreen({Key? key, required this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorScheduleController>(
      init: DoctorScheduleController(doctor: doctor),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${controller.doctor.name} schedule",
          ),
        ),
        body: controller.isFetchedData
            ? Calendar(data: controller.data)
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

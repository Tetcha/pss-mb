import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/all_doctor.controller.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/widgets/Doctor/doctor_intro.dart';
import 'package:pss_m/widgets/title/title.dart';

class AllDoctorScreen extends StatelessWidget {
  const AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllDoctorController>(
      init: AllDoctorController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(label: "All doctor:"),
            const SizedBox(
              height: 20,
            ),
            ...controller.availableDoctor.map((doctor) {
              return Column(
                children: [
                  DoctorIntro(doctor: doctor),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/doctor_info.controller.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';

class DoctorInfo extends StatelessWidget {
  final Doctor? doctor;
  const DoctorInfo({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorInfoController>(
      init: DoctorInfoController(doctor: doctor),
      builder: (_) => Container(
        color: Theme.of(context).secondaryHeaderColor,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                doctor?.avatar ?? "",
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_.doctorName} - ${_.doctorAge}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(doctor?.briefInfo ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

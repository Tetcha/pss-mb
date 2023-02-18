import 'package:flutter/material.dart';
import 'package:pss_m/core/constants/style.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';

class DoctorIntro extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback? onPressed;
  const DoctorIntro({super.key, required this.doctor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            doctor.avatar ?? "",
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: StyleTheme.textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(doctor.briefInfo ?? "")
            ],
          ),
        ),
        ElevatedButton(onPressed: onPressed, child: const Text("Book"))
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/widgets/Doctor/doctor_intro.dart';
import 'package:pss_m/widgets/layout/dashboard.dart';
import 'package:pss_m/widgets/title/title.dart';

class AllDoctorScreen extends StatelessWidget {
  const AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Doctor doctor = const Doctor(
      id: "1",
      createAt: "",
      updateAt: "",
      birthday: "01/01/2001",
      phone: "",
      gender: Gender.MALE,
      balance: 9999,
      status: true,
      name: "Dau Le Duc",
      email: "dauleduc2@gmail.com",
      photoUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg",
      introduction: "Hello, I'm Dau Le Duc. Nice to meet you! ",
    );
    List<Doctor> availableDoctor = [
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
    ];
    return DashBoardLayout(
        children: Container(
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
          ...availableDoctor.map((doctor) {
            return Column(
              children: [
                DoctorIntro(doctor: doctor),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ],
      ),
    ));
  }
}

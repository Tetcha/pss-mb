import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/home.controller.dart';
import 'package:pss_m/screens/demo.dart';
import 'package:pss_m/widgets/doctor_short_intro/doctor_short_intro.dart';
import 'package:pss_m/widgets/carousel/carousel.dart';
import 'package:pss_m/widgets/title/title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Column(
        children: [
          const SizedBox(height: 20),
          Carousel(
            data: _.carouselData,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const CompleteForm());
              },
              child: const Text("View demo form")),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(label: "Available now:"),
                const SizedBox(height: 20),
                ..._.availableDoctor.map((doctor) {
                  return Column(
                    children: [
                      DoctorShortIntro(
                          doctor: doctor,
                          onPressed: () => _.onDoctorTap(doctor)),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
                Center(
                  child: ElevatedButton(
                    onPressed: _.onOpenConferenceDemo,
                    child: const Text("See more"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

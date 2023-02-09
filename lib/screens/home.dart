import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/home.controller.dart';
import 'package:pss_m/widgets/Doctor/doctor_intro.dart';
import 'package:pss_m/widgets/carousel/carousel.dart';
import 'package:pss_m/widgets/title/title.dart';

class HomeScreen extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Column(
        children: [
          const SizedBox(height: 20),
          Carousel(
            data: controller.carouselData,
          ),
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
                ...controller.availableDoctor.map((doctor) {
                  return Column(
                    children: [
                      DoctorIntro(doctor: doctor),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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

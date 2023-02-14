import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/all_doctor.controller.dart';
import 'package:pss_m/widgets/Doctor/doctor_intro.dart';
import 'package:loadmore/loadmore.dart';

class AllDoctorScreen extends StatelessWidget {
  const AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = kToolbarHeight;
    final double bottomNavigationBarHeight = kBottomNavigationBarHeight;

    final double availableHeight = screenHeight -
        statusBarHeight -
        appBarHeight -
        bottomNavigationBarHeight -
        30;
    return GetBuilder<AllDoctorController>(
      init: AllDoctorController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Obx(
          () => controller.allDoctor.isEmpty
              ? const Center(
                  child: Text("Looking for doctors..."),
                )
              : RefreshIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  onRefresh: controller.onRefresh,
                  child: SizedBox(
                    height: availableHeight,
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemExtent: 85,
                      itemCount: controller.itemCount,
                      itemBuilder: (context, index) {
                        if (controller.isEnd.value == false &&
                            index == controller.allDoctor.length) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }

                        return DoctorIntro(
                          doctor: controller.allDoctor[index],
                        );
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
// ...controller.allDoctor.map((doctor) {
//                   return Column(
//                     children: [
//                       DoctorIntro(doctor: doctor),
//                       const SizedBox(height: 10),
//                     ],
//                   );
//                 }).toList()
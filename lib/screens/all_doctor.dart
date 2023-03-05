import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pss_m/controllers/all_doctor.controller.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/widgets/doctor_short_intro/doctor_short_intro.dart';

class AllDoctorScreen extends StatelessWidget {
  const AllDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    const double appBarHeight = kToolbarHeight;
    const double bottomNavigationBarHeight = kBottomNavigationBarHeight;

    final double availableHeight = screenHeight -
        statusBarHeight -
        appBarHeight -
        bottomNavigationBarHeight -
        30;
    return GetBuilder<AllDoctorController>(
      init: AllDoctorController(),
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Obx(
          () => _.allDoctor.isEmpty
              ? const Center(
                  child: Text("Looking for doctors..."),
                )
              : RefreshIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                  onRefresh: _.onRefresh,
                  child: SizedBox(
                    height: availableHeight,
                    child: ListView.builder(
                      controller: _.scrollController,
                      itemExtent: 85,
                      itemCount: _.itemCount,
                      itemBuilder: (context, index) {
                        if (_.isEnd.value == false &&
                            index == _.allDoctor.length) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        Doctor currentDoctor = _.allDoctor[index];
                        return DoctorShortIntro(
                          doctor: currentDoctor,
                          onPressed: () => _.onDoctorTap(currentDoctor),
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

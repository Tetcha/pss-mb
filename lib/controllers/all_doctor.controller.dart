import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pss_m/screens/doctor_schedule.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/services/doctor.service.dart';
import 'package:pss_m/interface/api/common.dart';
import 'package:pss_m/interface/api/doctor/doctor_filter/doctor_filter.dart';

class AllDoctorController extends GetxController {
  final DoctorService _doctorService = Get.find();
  late RxList<Doctor> allDoctor = RxList<Doctor>([]);

  ScrollController scrollController = ScrollController();
  RxBool isEnd = false.obs;
  int countValue = 10;
  int _currentPage = 0;

  get itemCount {
    if (isEnd.value) return allDoctor.length;
    return allDoctor.length + 1;
  }

  void getAllDoctor() async {
    FilterResponse<Doctor>? response = await _doctorService.getDoctorList(
        DoctorFilterPayload(currentPage: _currentPage, pageSize: 10));

    allDoctor.addAll(response!.data);
    countValue = response.count;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getAllDoctor();
    // on scroll to bottom, call to get more data
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onLoadMore();
      }
    });
  }

  Future<void> onRefresh() async {
    allDoctor.clear();
    _currentPage = 0;
    getAllDoctor();
  }

  Future<void> onLoadMore() async {
    if (allDoctor.length >= countValue) {
      isEnd.value = true;
      return;
    }
    _currentPage++;
    getAllDoctor();
  }

  void onDoctorTap(Doctor doctor) {
    Get.to(() => DoctorScheduleScreen(
          doctor: doctor,
        ));
  }
}

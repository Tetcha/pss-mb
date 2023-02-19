import 'package:get/get.dart';
import 'package:pss_m/api/student.api.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/interface/api/student/update_student/update_student.dart';

class StudentServices extends GetxController {
  final StudentApi _studentApi = Get.find();

  Future<Student?> updateUser(UpdateStudentPayload payload) async {
    try {
      final response = await _studentApi.updateUser(payload);

      Student student = Student.fromJson(response!.data!);
      return student;
    } catch (e) {
      return null;
    }
  }
}

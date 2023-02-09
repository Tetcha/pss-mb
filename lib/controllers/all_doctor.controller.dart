import 'package:get/get.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';

class AllDoctorController extends GetxController {
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

  late List<Doctor> availableDoctor = [
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
}

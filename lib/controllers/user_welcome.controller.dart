import 'package:get/get.dart';
import 'package:pss_m/core/providers/user.provider.dart';

class UserWelcomeController extends GetxController {
  UserProvider _userProvider = Get.find();

  String get avatarUrl =>
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg";
}

import 'package:get/get.dart';
import 'package:pss_m/providers/user.provider.dart';

class UserWelcomeController extends GetxController {
  final UserProvider _userProvider = Get.find();

  String? get avatarUrl => _userProvider.userAvatarUrl;

  String get name => _userProvider.currentUser.value.name;
  double get balance => _userProvider.currentUser.value.balance;
}

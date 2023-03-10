import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/api/auth.api.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/services/facebook.service.dart';
import 'package:pss_m/services/google.service.dart';
import 'package:pss_m/util/date.dart';

const defaultUser = Student(
  id: "",
  birthday: "",
  studentCode: "",
  phone: "",
  gender: Gender.MALE,
  balance: 0,
  name: "",
  email: "",
  isActive: true,
);

class UserProvider extends GetxController {
  final AuthApi _authApi = Get.find();
  final SharedPreferenceProvider _sharedPreferenceProvider = Get.find();
  final GoogleService _googleService = Get.find();
  final FacebookService _facebookService = Get.find();

  LoginType? loginType;
  var currentUser = Rx<Student>(defaultUser);
  RxBool isLogin = false.obs;
  String? get birthday {
    if (currentUser.value.birthday == null) return null;
    return DateUtil.toText(DateTime.parse(currentUser.value.birthday ?? ""));
  }

  Student get user => currentUser.value;
  String? get userAvatarUrl {
    String defaultAvatar =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg";
    if (loginType == LoginType.FACEBOOK) {
      return _facebookService.facebookAccount.value?.photoURL ?? defaultAvatar;
    } else if (loginType == LoginType.GOOGLE) {
      return _googleService.googleAccount.value?.photoUrl ?? defaultAvatar;
    }

    return defaultAvatar;
  }

  set setIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
  }

  void resetData() {
    currentUser.value = defaultUser;
    isLogin.value = false;
    _googleService.resetData();
    _facebookService.resetData();
  }

  void updateUserInfo() {
    getCurrentUser();
  }

  Future<bool> loginFacebook() async {
    String? accessToken = await _facebookService.login();
    _sharedPreferenceProvider.saveAuthToken(accessToken ?? "");
    setIsLogin = true;

    return true;
  }

  Future<bool> loginGoogle() async {
    String? accessToken = await _googleService.login();
    _sharedPreferenceProvider.saveAuthToken(accessToken ?? "");
    setIsLogin = true;

    return true;
  }

  Future<Student?> getCurrentUser() async {
    try {
      var res = await _authApi.getCurrentUser();

      var newUser = Student.fromJson(res.data ?? {});
      currentUser.value = newUser;
      isLogin.value = true;
      return newUser;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        resetData();
        _sharedPreferenceProvider.removeAuthToken();
      }
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
}

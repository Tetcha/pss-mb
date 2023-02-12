import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';
import 'package:pss_m/core/services/facebook.auth.dart';
import 'package:pss_m/core/services/google.auth.dart';
import 'package:pss_m/interface/api/login.api.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  var currentUser = Rx<Student>(defaultUser);
  RxBool isLogin = false.obs;

  Student get user => currentUser.value;

  set setIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
  }

  void resetData() {
    currentUser.value = defaultUser;
    isLogin.value = false;
    _googleService.resetData();
    _facebookService.resetData();
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
    }
  }
}

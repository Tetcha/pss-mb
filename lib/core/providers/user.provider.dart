import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Student/student.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';
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
);

class UserProvider extends GetxController {
  final AuthApi _authApi = Get.find();
  final SharedPreferenceProvider _sharedPreferenceProvider = Get.find();

  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/userinfo.profile"
    ],
  );
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var googleAuth = Rx<GoogleSignInAuthentication?>(null);
  var currentUser = Rx<Student>(defaultUser);

  RxBool isLogin = false.obs;

  get accessToken => googleAuth.value?.accessToken;
  get avatarUrl =>
      googleAccount.value?.photoUrl ??
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg";

  get email => currentUser.value.email;
  get name => currentUser.value.name;
  get studentCode => currentUser.value.studentCode;
  get phone => currentUser.value.phone;

  set setIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
  }

  void resetData() {
    currentUser.value = defaultUser;
    isLogin.value = false;
    googleAccount.value = null;
    googleAuth.value = null;
  }

  Future<bool> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print("loginResult $loginResult");
    // Create a credential from the access token

    return true;
  }

  Future<bool> loginGoogle() async {
    // var googleAccountResponse = await _googleSignIn.signIn();
    // if (googleAccountResponse == null) {
    //   Get.snackbar("Error", "Something wrong happens, please try again later!",
    //       backgroundColor: Colors.green, colorText: Colors.white);
    //   throw Exception('Google Sign In Failed');
    // }

    // // set value
    // googleAccount.value = googleAccountResponse;
    // googleAuth.value = await googleAccountResponse.authentication;
    // print(googleAuth.value?.idToken);
    // store access token
    var loginRes = await _authApi.login(LoginApiPayload(
      accessToken: googleAuth.value?.idToken ??
          "eyJhbGciOiJSUzI1NiIsImtpZCI6ImI0OWM1MDYyZDg5MGY1Y2U0NDllODkwYzg4ZThkZDk4YzRmZWUwYWIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5NTU2MTI1MDcyMTYtNnA5Ymd2bDBjcTI1aTdoOGQ2azd0OHZmNzJ1Z250aTcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5NTU2MTI1MDcyMTYtYWhwMHRpb3E2YWxtZmw5M2o0dDZnc2Y2bGlrdWdodGwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTUwMTQ2NDY2OTE2MDc0NDE0ODQiLCJlbWFpbCI6ImRhdWxlZHVjMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6IkR1YyBEYXUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNksxcXM2RWY4S0N0NWxmZUJydHl4Nng3SHU4TmtrbW9pMC12S0NTQT1zOTYtYyIsImdpdmVuX25hbWUiOiJEdWMiLCJmYW1pbHlfbmFtZSI6IkRhdSIsImxvY2FsZSI6InZpIiwiaWF0IjoxNjc1ODUyNjc4LCJleHAiOjE2NzU4NTYyNzh9.Zba-8klPH_m1gVCAqpv07dgoBTuvyuG_g23lkYT-UOIogwJGQor-kqi_hbQ8pZpDw8W_MLMOiu47Me5MGmi2K5AQrDM75XQc_mYpz9B8gmLieHeZ1ATO8eDSGm4v1d08_j5_FEVH-DfXJ-bLGqsuafhbij818IhspLDUYktLPjJjw0UUSXNrinloiXWnOXPArQJytWiKPOrvHu2Ozm0HIkfUzu2s85clMB0TGbONx1GpXa0rvGuGJWFbuBqdS7N_kim_YHaElb7qUC5",
    ));
    _sharedPreferenceProvider.saveAuthToken(loginRes ?? "");
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

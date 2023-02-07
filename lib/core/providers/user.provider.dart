import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/core/models/User/user.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';
import 'package:pss_m/interface/api/login.api.dart';

const defaultUser = User(
  id: "",
  name: "",
  username: "",
  email: "",
  createAt: "",
  updateAt: "",
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
  User currentUser = defaultUser;

  RxBool isLogin = false.obs;

  get accessToken => googleAuth.value?.accessToken;

  set setIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
  }

  void resetData() {
    currentUser = defaultUser;
    isLogin.value = false;
    googleAccount.value = null;
    googleAuth.value = null;
  }

  login() async {
    var googleAccountResponse = await _googleSignIn.signIn();
    if (googleAccountResponse == null) {
      Get.snackbar("Error", "Something wrong happens, please try again later!",
          backgroundColor: Colors.green, colorText: Colors.white);
      throw Exception('Google Sign In Failed');
    }

    // set value
    googleAccount.value = googleAccountResponse;
    googleAuth.value = await googleAccountResponse.authentication;

    // store access token
    print("googleAuth.value?.idToken ${googleAuth.value?.idToken}");
    var loginRes = await _authApi.login(LoginApiPayload(
      accessToken: googleAuth.value?.idToken ?? "",
    ));
    print("loginRes $loginRes");
    // _sharedPreferenceProvider.saveAuthToken(loginRes ?? "");
    setIsLogin = true;
  }

  Future<User?> getCurrentUser() async {
    var res = await _authApi.getCurrentUser();

    if (res == null) throw Exception('Get Current User Failed');

    var resUser = json.decode(res.toString());
    var newUser = User.fromJson(resUser);

    currentUser = newUser;
    isLogin.value = true;
    return newUser;
  }
}

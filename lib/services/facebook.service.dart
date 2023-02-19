import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pss_m/api/auth.api.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:pss_m/interface/api/auth/login/login.api.dart';

class FacebookService extends GetxController {
  final AuthApi _authApi = Get.find();
  var facebookAccount = Rx<User?>(null);
  void resetData() {}

  Future<UserCredential> getCredential() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? "");

    // Once signed in, return the UserCredential
    UserCredential result = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    facebookAccount.value = result.user;
    return result;
  }

  Future<String?> login() async {
    UserCredential credential = await getCredential();
    final idToken = await credential.user?.getIdToken();
    // store access token
    var accessToken = await _authApi.login(LoginApiPayload(
      accessToken: idToken ??
          "eyJhbGciOiJSUzI1NiIsImtpZCI6ImFlYjMxMjdiMjRjZTg2MDJjODEyNDUxZThmZTczZDU4MjkyMDg4N2MiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiTGUgQ3VvbmciLCJwaWN0dXJlIjoiaHR0cHM6Ly9ncmFwaC5mYWNlYm9vay5jb20vMTA0NzI3MDI5MjEwODk1L3BpY3R1cmUiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHN5Y2gtc3VwcG9ydC1zeXN0ZW0tMzcyMTMiLCJhdWQiOiJwc3ljaC1zdXBwb3J0LXN5c3RlbS0zNzIxMyIsImF1dGhfdGltZSI6MTY3NjE4MzE5MiwidXNlcl9pZCI6IlBHWUs3dnU4aTZVY0gwOWtFN01acWRrdHY2azEiLCJzdWIiOiJQR1lLN3Z1OGk2VWNIMDlrRTdNWnFka3R2NmsxIiwiaWF0IjoxNjc2MTgzMTkyLCJleHAiOjE2NzYxODY3OTIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZmFjZWJvb2suY29tIjpbIjEwNDcyNzAyOTIxMDg5NSJdfSwic2lnbl9pbl9wcm92aWRlciI6ImZhY2Vib29rLmNvbSJ9fQ.eb38rs1-fufpT6n5RcOg03_zN982kYZUyQmrbOjejP-sv91ZybIESJ-C4So7tMCaruJ4TdJzNC3X6__WOvK4HAPHuMwvb8xbMG0HAU2t29ieC484DXpGENomtGRqkIF4ww-wK8SPo-1qKXxCUNxlPN0h5-T_Ip_AGqeTjmIU9akFDi2zwEToHYEDyzmZ0uwwxvMgHL_U7Jj5r5xtGIfSn44joKYjDaK-ASsRMmEc9g6EaTqF9AjxOERT_ti16DdQwQEQ3sz1nrQljD1bxzsV4GkvQtWElVIt_CxkSdZkvRZyp5CUQLn-iYhFowLMiFjdjQAouxKppLCAWPvunF_hJg",
    ));

    return accessToken;
  }
}

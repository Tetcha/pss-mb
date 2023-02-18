import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pss_m/core/api/auth.api.dart';
import 'package:pss_m/interface/api/auth/login/login.api.dart';

class GoogleService extends GetxService {
  final AuthApi _authApi = Get.find();

  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/userinfo.profile"
    ],
  );
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var googleAuth = Rx<GoogleSignInAuthentication?>(null);
  get accessToken => googleAuth.value?.accessToken;
  get avatarUrl =>
      googleAccount.value?.photoUrl ??
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg";

  void resetData() {
    googleAccount.value = null;
    googleAuth.value = null;
    _googleSignIn.signOut();
  }

  Future<String?> login() async {
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
    var accessToken = await _authApi.login(LoginApiPayload(
      accessToken: googleAuth.value?.idToken ??
          "eyJhbGciOiJSUzI1NiIsImtpZCI6ImI0OWM1MDYyZDg5MGY1Y2U0NDllODkwYzg4ZThkZDk4YzRmZWUwYWIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5NTU2MTI1MDcyMTYtNnA5Ymd2bDBjcTI1aTdoOGQ2azd0OHZmNzJ1Z250aTcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5NTU2MTI1MDcyMTYtYWhwMHRpb3E2YWxtZmw5M2o0dDZnc2Y2bGlrdWdodGwuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTUwMTQ2NDY2OTE2MDc0NDE0ODQiLCJlbWFpbCI6ImRhdWxlZHVjMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6IkR1YyBEYXUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNksxcXM2RWY4S0N0NWxmZUJydHl4Nng3SHU4TmtrbW9pMC12S0NTQT1zOTYtYyIsImdpdmVuX25hbWUiOiJEdWMiLCJmYW1pbHlfbmFtZSI6IkRhdSIsImxvY2FsZSI6InZpIiwiaWF0IjoxNjc1ODUyNjc4LCJleHAiOjE2NzU4NTYyNzh9.Zba-8klPH_m1gVCAqpv07dgoBTuvyuG_g23lkYT-UOIogwJGQor-kqi_hbQ8pZpDw8W_MLMOiu47Me5MGmi2K5AQrDM75XQc_mYpz9B8gmLieHeZ1ATO8eDSGm4v1d08_j5_FEVH-DfXJ-bLGqsuafhbij818IhspLDUYktLPjJjw0UUSXNrinloiXWnOXPArQJytWiKPOrvHu2Ozm0HIkfUzu2s85clMB0TGbONx1GpXa0rvGuGJWFbuBqdS7N_kim_YHaElb7qUC5",
    ));

    return accessToken;
  }
}

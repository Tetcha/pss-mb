import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/store.dart';
import 'package:pss_m/providers/api.provider.dart';
import 'package:pss_m/providers/ui.provider.dart';
import 'package:pss_m/providers/sharePreference.provider.dart';
import 'package:pss_m/screens/login.dart';
import 'package:pss_m/services/Toast.service.dart';

class ApiClient extends GetxService {
  final ApiProvider _apiProvider = Get.find();
  final UIProvider _uiProvider = Get.find();
  final SharedPreferenceProvider _preferenceProvider = Get.find();
  final ToastService _toastService = Get.put(ToastService());
  Dio http = Dio(
    BaseOptions(
      baseUrl: 'http://157.230.46.243:4000/api/v1',
    ),
  );

  ApiClient() {
    handleOnLoad();
  }

  handleOnLoad() async {
    http.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // include headers
      options.contentType = "application/json;charset=UTF-8";
      if (_preferenceProvider.instance.containsKey(StoreKey.authToken)) {
        options.headers[StoreKey.authToken] =
            'Bearer ${_preferenceProvider.authToken}';
      }
      //open loading
      // _uiProvider.setIsLoading = true;

      return handler.next(options);
    }, onResponse: (response, handler) async {
      // make the loading animation at least 500ms
      Timer(const Duration(milliseconds: 500), () {
        _uiProvider.setIsLoading = false;
      });
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      // make the loading animation at least 500ms
      Timer(const Duration(milliseconds: 500), () {
        // _uiProvider.setIsLoading = false;
      });

      if (e.response?.statusCode == 401) {
        _preferenceProvider.removeAuthToken();
        Get.off(() => const LoginScreen());
        _toastService
            .showWarning('Your session has expired. Please login again');

        return handler.next(e);
      }

      if (e.response?.statusCode == 400) {
        var errorDetails =
            json.decode(e.response.toString()).cast<String, String>();
        _apiProvider.setErrorDetails(errorDetails);
      }
      return handler.next(e);
    }));
  }
}

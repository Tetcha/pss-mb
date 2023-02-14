import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/core/constants/store.dart';
import 'package:pss_m/core/providers/api.provider.dart';
import 'package:pss_m/core/providers/ui.provider.dart';
import 'package:pss_m/core/providers/sharePreference.provider.dart';

class ApiClient extends GetxService {
  final ApiProvider _apiProvider = Get.find();
  final UIProvider _uiProvider = Get.find();
  final SharedPreferenceProvider preferenceHelper = Get.find();
  Dio http = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:4000/api/v1',
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
      if (preferenceHelper.instance.containsKey(StoreKey.authToken)) {
        options.headers[StoreKey.authToken] =
            'Bearer ${preferenceHelper.authToken}';
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

      if (e.response?.statusCode == 400) {
        var errorDetails =
            json.decode(e.response.toString()).cast<String, String>();
        _apiProvider.setErrorDetails(errorDetails);
      }
      return handler.next(e);
    }));
  }
}

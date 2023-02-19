import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pss_m/api/config.dart';

class TwilioApi {
  final ApiClient _apiClient = Get.find();
  final accessTokenUrl =
      'https://twiliochatroomaccesstoken-5887.twil.io/accessToken';
  Future<String> createToken(String identity) async {
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(accessTokenUrl + '?user=' + identity).toString();
      final response = await _apiClient.http
          .get<Map<String, dynamic>>(url, options: Options(headers: header));

      return response.data?['accessToken'];
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }
}

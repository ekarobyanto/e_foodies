import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_foodies/src/utills/connection_checker.dart';

class APIService {
  static const String _apiBaseUrl = "efoodies.pythonanywhere.com";
  static const String _apiPath = "/api";

  Uri buildUri({
    required String endpoints,
    Map<String, dynamic>? params,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoints",
      queryParameters: params,
    );
  }

  Future<T> call<T>(
      {required Future<Response> Function() request, parse}) async {
    await checkConnection();
    try {
      final response = await request().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw {'detail': 'Connection Timeout'};
        },
      );
      return parse(response.data);
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Dio Error=====');
      print(res?.data);
      print(res?.statusCode.toString() ?? 'Unknown Error');
      if (res?.data['detail'] == 'Given token not valid for any token type') {
        throw {'detail': 'Invalid Token'};
      }
      if (res != null) {
        throw res.data['detail'];
      } else {
        throw {'detail': 'Unknown Error'};
      }
    }
  }
}

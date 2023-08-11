import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_foodies/src/core/domain/failure.dart';
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

  /// The `call` method is a generic method that makes an HTTP request and handles the response.
  Future<T> call<T>(
      {required Future<Response> Function() request, parse}) async {
    await checkConnection();
    try {
      final response = await request().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Failure(
            code: 408,
            message: 'Connection TimeOut',
          );
        },
      );
      return parse(response.data);
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Dio Error=====');
      if (res?.data['mess'] == 'token_not_valid') {
        throw Failure(message: 'Token Expired', code: 401);
      }
      if (res != null) {
        throw Failure(
          code: res.statusCode ?? 0,
          message: res.data['detail'],
        );
      } else {
        throw Failure(
          code: 0,
          message: 'idk what happened',
        );
      }
    }
  }
}

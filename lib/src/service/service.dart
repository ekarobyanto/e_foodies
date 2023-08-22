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
    final url = Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoints",
      queryParameters: params,
    );
    log(url.toString());
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
      log(response.data.toString());
      return parse(response.data);
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Dio Error=====');
      if (res?.data['detail'] ==
          'Token yang diberikan tidak valid untuk semua jenis token') {
        throw Failure(message: 'Token Expired', code: 401);
      }
      //error dev
      if (res != null && res.data['detail'] != null) {
        log(res.data['detail'].toString());
        throw Failure(
          code: res.statusCode ?? 0,
          message: res.data['detail'],
        );
      } else {
        log(res.toString());
        throw Failure(
          code: 0,
          message: res.toString(),
        );
      }
    }
  }
}

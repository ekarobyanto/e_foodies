import 'dart:developer';

import 'package:dio/dio.dart';

class APIService {
  static const String _apiBaseUrl = "asslink-middle-745kw5phpq-uc.a.run.app";
  static const String _apiPath = "/api";

  Uri _buildUri({
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
    try {
      final response = await request().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw {'errors': 'Connection Timeout'};
        },
      );
      return parse(response.data);
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Dio Error=====');
      print(res?.data);
      print(res?.statusCode.toString() ?? 'Unknown Error');
      if (res?.data['detail'] == 'Given token not valid for any token type') {
        //
      }
      if (res != null) {
        throw res.data;
      } else {
        throw 'Unknown Error';
      }
    }
  }
}

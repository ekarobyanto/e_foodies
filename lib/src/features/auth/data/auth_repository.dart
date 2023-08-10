import 'package:dio/dio.dart';

import '../../../service/service.dart';

class AuthRepository {
  final dio = Dio();
  final api = APIService();

  Future login({
    required String email,
    required String password,
  }) async {
    await api.call(
      request: () async => await dio.postUri(
        api.buildUri(endpoints: '/login/'),
        data: {
          'email': email,
          'password': password,
        },
      ),
      parse: (data) => data,
    );
  }

  Future register({
    required String name,
    required String email,
    required String address,
    required String password,
  }) async {
    return await api.call(
      request: () async => await dio.postUri(
        api.buildUri(endpoints: '/register/'),
        data: {
          'username': name,
          'email': email,
          'address': address,
          'password': password,
        },
      ),
      parse: (data) => data,
    );
  }

  Future refreshToken(String refreshToken) async {
    return await api.call(
      request: () async => await dio.postUri(
        api.buildUri(endpoints: '/token/refresh/'),
        data: {
          'refresh': refreshToken,
        },
      ),
      parse: (data) => data,
    );
  }
}

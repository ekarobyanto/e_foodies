import 'package:dio/dio.dart';
import 'package:e_foodies/src/features/account/domain/account.dart';

import '../../../core/data/repository_base.dart';

class AccountRepository extends RepositoryBase {
  Future<Account> getAccount({required String token}) async {
    return await service.call(
      request: () async {
        return await dio.getUri(
          service.buildUri(
            endpoints: '/profile/',
          ),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
      },
      parse: (json) => Account.fromJson(json),
    );
  }

  Future<Account> updateAccount(
      {required String token, required Account data, String? password}) async {
    return await service.call(
      request: () async {
        return await dio.putUri(
          service.buildUri(
            endpoints: '/profile/',
          ),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: {
            {
              "username": data.username,
              "img": data.img,
              "email": data.email,
              "address": data.address,
              if (password != null) "password": password,
            }
          },
        );
      },
      parse: (json) => Account.fromJson(json),
    );
  }
}

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
        final formData = FormData.fromMap({
          if (data.username != '') "username": data.username,
          if (data.img != '') "img": await MultipartFile.fromFile(data.img),
          if (data.email != '') "email": data.email,
          if (data.address != '') "address": data.address,
          if (password != '') "password": password,
        });
        print(formData.fields);
        print(formData.files);
        return await dio.putUri(
          service.buildUri(
            endpoints: '/profile/',
          ),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: formData,
        );
      },
      parse: (json) => Account.fromJson(json),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:e_foodies/src/features/store/domain/store.dart';

import '../../../core/data/repository_base.dart';
import '../../../core/domain/failure.dart';
import '../../../core/domain/pagination.dart';
import '../domain/store-form/store_form.dart';

class StoreRepository extends RepositoryBase {
  Future getAllStore(String token, int pageKey, int pageSize) async {
    try {
      return await service.call(
        request: () {
          return dio.getUri(
            service.buildUri(
              endpoints: '/store/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (response) {
          return Pagination<Store>.fromJson(
            response,
            (data) => Store.fromJson(data as Map<String, dynamic>),
          );
        },
      );
    } on Failure catch (_) {
      rethrow;
    }
  }

  Future getStoreById(String token, String id) async {
    try {
      return await service.call(
        request: () {
          return dio.getUri(
            service.buildUri(
              endpoints: '/store/$id/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (response) {
          return Store.fromJson(response);
        },
      );
    } on Failure catch (_) {
      rethrow;
    }
  }

  Future getUserStore({required String token}) async {
    try {
      return await service.call(
        request: () {
          return dio.getUri(
            service.buildUri(
              endpoints: '/my-store/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (response) {
          return response.data;
        },
      );
    } on Failure catch (_) {
      rethrow;
    }
  }

  Future openStore({required String token}) async {
    try {
      return await service.call(
        request: () => dio.putUri(service.buildUri(endpoints: '/open-store/'),
            options: Options(headers: {'Authorization': 'Bearer $token'}),
            data: {'is_store': true}),
        parse: (response) => response,
      );
    } on Failure catch (_) {
      rethrow;
    }
  }

  Future createStore({required String token, required StoreForm form}) async {
    try {
      final formData = FormData.fromMap({
        'name': form.name,
        'desc': form.desc,
        'address': form.address,
        'phone': form.phone,
        'open_time': form.openTime,
        'close_time': form.closeTime,
        'img': await MultipartFile.fromFile(form.imagePath),
      });
      return await service.call(
        request: () => dio.postUri(
          service.buildUri(endpoints: '/my-store/'),
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: formData,
        ),
        parse: (response) => response,
      );
    } on Failure catch (_) {
      rethrow;
    }
  }
}

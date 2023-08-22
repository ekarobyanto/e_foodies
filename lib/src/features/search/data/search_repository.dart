import 'package:dio/dio.dart';
import 'package:e_foodies/src/core/data/repository_base.dart';

import '../../../core/domain/failure.dart';
import '../../../core/domain/pagination.dart';
import '../../store/domain/store.dart';

class SearchRepository extends RepositoryBase {
  Future search({
    required String token,
    required String query,
    required int pageKey,
    required int pageSize,
  }) async {
    try {
      return await service.call(
        request: () {
          return dio.getUri(
            service.buildUri(
              endpoints: '/store/',
              params: {
                'search': query,
                'page': pageKey.toString(),
                'page_size': pageSize.toString()
              },
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
}

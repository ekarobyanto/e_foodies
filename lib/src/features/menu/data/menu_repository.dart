import 'package:dio/dio.dart';
import 'package:e_foodies/src/core/domain/failure.dart';
import 'package:e_foodies/src/features/menu/domain/menu/menu.dart';
import 'package:e_foodies/src/service/service.dart';

import '../../../core/domain/pagination.dart';

class MenuRepository {
  final api = APIService();
  final dio = Dio();

  Future allMenu(String token, int pageKey, int pageSize) async {
    try {
      return await api.call(request: () async {
        return await dio.getUri(
          api.buildUri(
            endpoints: '/recipe/',
            params: {
              'page': pageKey.toString(),
              'page_size': pageSize.toString()
            },
          ),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
      }, parse: (data) {
        return Pagination<Menu>.fromJson(
          data,
          (data) => Menu.fromJson(data as Map<String, dynamic>),
        );
      });
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      Failure(message: e.toString(), code: 0);
    }
  }
}

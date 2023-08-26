import 'package:dio/dio.dart';
import 'package:e_foodies/src/core/domain/failure.dart';
import 'package:e_foodies/src/features/menu/domain/menu-form/menu_form.dart';
import 'package:e_foodies/src/features/menu/domain/menu/menu.dart';

import '../../../core/data/repository_base.dart';
import '../../../core/domain/pagination.dart';

class MenuRepository extends RepositoryBase {
  Future allMenu(String token, int pageKey, int pageSize) async {
    try {
      return await service.call(request: () async {
        return await dio.getUri(
          service.buildUri(
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

  Future createMenu(String token, MenuForm form) async {
    try {
      return await service.call(
        request: () async {
          return await dio.postUri(
            service.buildUri(
              endpoints: '/my-recipe/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
            data: {
              "name": form.name,
              "desc": form.description,
              "price": form.price,
              "ingredients": form.ingredients.map((e) => {"name": e}).toList(),
            },
          );
        },
        parse: (data) => data,
      );
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      Failure(message: e.toString(), code: 0);
    }
  }

  Future updateMenuImage(
      String recipeId, String imagePath, String token) async {
    try {
      final data = FormData.fromMap({
        "img": await MultipartFile.fromFile(imagePath),
      });
      return await service.call(
        request: () async {
          return await dio.putUri(
            service.buildUri(
              endpoints: '/my-recipe/$recipeId/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
            data: data,
          );
        },
        parse: (data) => data,
      );
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      Failure(message: e.toString(), code: 0);
    }
  }

  Future editMenuForm(String token, MenuForm form, String menuId) async {
    try {
      return await service.call(
        request: () async {
          return await dio.putUri(
            service.buildUri(
              endpoints: '/my-recipe/$menuId/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
            data: {
              if (form.name != '') "name": form.name,
              if (form.description != '') "description": form.description,
              if (form.price != '') "price": form.price,
              if (form.ingredients != [])
                "ingredients": form.ingredients
                    .map((e) => {
                          'name': e,
                          'number': form.ingredients.indexOf(e) + 1,
                        })
                    .toList(),
            },
          );
        },
        parse: (data) => data,
      );
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      Failure(message: e.toString(), code: 0);
    }
  }

  Future deleteMenu(String token, String menuId) async {
    try {
      return await service.call(
        request: () async {
          return await dio.deleteUri(
            service.buildUri(
              endpoints: '/my-recipe/$menuId/',
            ),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } on Failure catch (_) {
      rethrow;
    } catch (e) {
      Failure(message: e.toString(), code: 0);
    }
  }
}

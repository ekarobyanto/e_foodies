import 'package:freezed_annotation/freezed_annotation.dart';

import '../../menu/domain/menu/menu.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String id,
    required String name,
    required String desc,
    String? img,
    required String user,
    required String address,
    required String phone,
    required List<Menu> menus,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

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
    @JsonKey(name: 'open_time') required String openTime,
    @JsonKey(name: 'close_time') required String closeTime,
    required String phone,
    @Default([]) List<Menu> recipes,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient/ingredient.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  factory Menu({
    @Default('') String id,
    @Default('') String name,
    @Default('') String user,
    @Default('') String store,
    @Default('') @JsonKey(name: 'store_address') String storeAddress,
    @Default('') @JsonKey(name: 'id_store') String storeId,
    @Default('') String desc,
    @Default('') String img,
    int? price,
    @Default([]) List<Ingredient> ingredients,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

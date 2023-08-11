// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient/ingredient.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  factory Menu({
    required String id,
    required String name,
    required String user,
    required String store,
    @JsonKey(name: 'store_address') required String storeAddress,
    @Default('') String desc,
    @Default('') String img,
    required List<Ingredient> ingredients,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

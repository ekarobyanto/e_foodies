import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_form.freezed.dart';

@freezed
class MenuForm with _$MenuForm {
  factory MenuForm({
    required String name,
    required String description,
    required String price,
    required List<String> ingredients,
    required String image,
  }) = _MenuForm;
}

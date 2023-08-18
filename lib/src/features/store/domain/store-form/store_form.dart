import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_form.freezed.dart';
part 'store_form.g.dart';

@freezed
class StoreForm with _$StoreForm {
  factory StoreForm({
    required String name,
    required String desc,
    required String address,
    required String phone,
    required String openTime,
    required String closeTime,
    required String imagePath,
  }) = _StoreForm;

  factory StoreForm.fromJson(Map<String, dynamic> json) =>
      _$StoreFormFromJson(json);
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  factory Account({
    required String id,
    required String username,
    required String email,
    @Default('') String img,
    required String address,
    @JsonKey(name: 'is_store') required bool isStore,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

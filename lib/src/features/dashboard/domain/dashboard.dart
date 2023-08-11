// ignore_for_file: invalid_annotation_target

import 'package:e_foodies/src/features/store/domain/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../menu/domain/menu/menu.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    @Default('') String? username,
    @Default('') String? img,
    @JsonKey(name: 'name_store') @Default('') String? nameStore,
    @JsonKey(name: 'status_store')
    @Default('never_requested')
    String? statusStore,
    @JsonKey(name: 'desc_store') @Default('') String? idStore,
    @JsonKey(name: 'img_store') @Default('') String? imageStore,
    @JsonKey(name: 'address_store') @Default('') String? addressStore,
    @Default([]) List<Menu>? menu,
    @Default([]) List<Store>? store,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}

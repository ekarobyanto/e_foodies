part of 'add_menu_cubit.dart';

@freezed
class AddMenuState with _$AddMenuState {
  const factory AddMenuState.initial() = _Initial;
  const factory AddMenuState.success() = _Success;
  const factory AddMenuState.error(String e) = _Error;
  const factory AddMenuState.loading() = _Loading;
}

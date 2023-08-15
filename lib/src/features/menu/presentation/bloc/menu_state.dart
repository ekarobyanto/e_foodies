part of 'menu_bloc.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial() = _Initial;
  const factory MenuState.error(String e) = _Error;
  const factory MenuState.success(Pagination<Menu> menus) = _Success;
  const factory MenuState.pageUpdated(Pagination<Menu> menus) = _Updated;
  const factory MenuState.pageError(String e) = _PageError;
}

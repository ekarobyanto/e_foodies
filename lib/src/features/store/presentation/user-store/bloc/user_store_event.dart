part of 'user_store_bloc.dart';

@freezed
class UserStoreEvent with _$UserStoreEvent {
  const factory UserStoreEvent.started() = _Started;
  const factory UserStoreEvent.updateMenu(MenuForm form, String id) =
      _UpdateMenu;
  const factory UserStoreEvent.deleteMenu(String id) = _DeleteMenu;
}

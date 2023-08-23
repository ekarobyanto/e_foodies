part of 'edit_user_store_cubit.dart';

@freezed
class EditUserStoreState with _$EditUserStoreState {
  const factory EditUserStoreState.initial() = _Initial;
  const factory EditUserStoreState.loading() = _Loading;
  const factory EditUserStoreState.error(String error) = _Error;
  const factory EditUserStoreState.updateSucces() = _Succes;
}

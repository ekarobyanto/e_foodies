part of 'user_store_bloc.dart';

@freezed
class UserStoreState with _$UserStoreState {
  const factory UserStoreState.initial() = _Initial;
  const factory UserStoreState.loading() = _Loading;
  const factory UserStoreState.loaded(Store store, [String? msg]) = _Loaded;
  const factory UserStoreState.error(String error) = _Error;
}

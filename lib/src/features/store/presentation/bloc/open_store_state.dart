part of 'open_store_bloc.dart';

@freezed
class OpenStoreState with _$OpenStoreState {
  const factory OpenStoreState.initial() = _Initial;
  const factory OpenStoreState.storeLoaded(Store store) = _StoreLoaded;
  const factory OpenStoreState.error(String e) = _StoreError;
}

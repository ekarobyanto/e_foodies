part of 'create_store_bloc.dart';

@freezed
class CreateStoreState with _$CreateStoreState {
  const factory CreateStoreState.initial() = _Initial;
  const factory CreateStoreState.onRequest() = _OnRequest;
  const factory CreateStoreState.storeCreated() = _StoreCreated;
  const factory CreateStoreState.createStoreFailed({required String error}) =
      _Failure;
}

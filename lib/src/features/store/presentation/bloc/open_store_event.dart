part of 'open_store_bloc.dart';

@freezed
class OpenStoreEvent with _$OpenStoreEvent {
  const factory OpenStoreEvent.viewStore(String storeId) = _ViewStore;
  const factory OpenStoreEvent.started() = _Started;
}

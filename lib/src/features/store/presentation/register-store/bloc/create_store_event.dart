part of 'create_store_bloc.dart';

@freezed
class CreateStoreEvent with _$CreateStoreEvent {
  const factory CreateStoreEvent.started() = _Started;
  const factory CreateStoreEvent.submitStore({required StoreForm form}) =
      _Submit;
}

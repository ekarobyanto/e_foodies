part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.started(int pageKey, int pageSize) = _Started;
}

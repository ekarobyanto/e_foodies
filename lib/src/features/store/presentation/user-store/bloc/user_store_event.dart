part of 'user_store_bloc.dart';

@freezed
class UserStoreEvent with _$UserStoreEvent {
  const factory UserStoreEvent.started() = _Started;
}

part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.success() = _Success;
  const factory RegisterState.onRequest() = _Request;
  const factory RegisterState.error(String error) = _Error;
}

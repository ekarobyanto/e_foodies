part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.succes(Account account) = _Succes;
  const factory AccountState.succesUpdate(Account account) = _SuccesUpdate;
  const factory AccountState.error(String e) = _Error;
}

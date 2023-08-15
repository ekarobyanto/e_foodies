// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account, String? password) updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account, String? password)? updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account, String? password)? updateAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AccountEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account, String? password) updateAccount,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account, String? password)? updateAccount,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account, String? password)? updateAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AccountEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_UpdateAccountCopyWith<$Res> {
  factory _$$_UpdateAccountCopyWith(
          _$_UpdateAccount value, $Res Function(_$_UpdateAccount) then) =
      __$$_UpdateAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account, String? password});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_UpdateAccountCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$_UpdateAccount>
    implements _$$_UpdateAccountCopyWith<$Res> {
  __$$_UpdateAccountCopyWithImpl(
      _$_UpdateAccount _value, $Res Function(_$_UpdateAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? password = freezed,
  }) {
    return _then(_$_UpdateAccount(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_UpdateAccount implements _UpdateAccount {
  const _$_UpdateAccount(this.account, this.password);

  @override
  final Account account;
  @override
  final String? password;

  @override
  String toString() {
    return 'AccountEvent.updateAccount(account: $account, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAccount &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAccountCopyWith<_$_UpdateAccount> get copyWith =>
      __$$_UpdateAccountCopyWithImpl<_$_UpdateAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Account account, String? password) updateAccount,
  }) {
    return updateAccount(account, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Account account, String? password)? updateAccount,
  }) {
    return updateAccount?.call(account, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Account account, String? password)? updateAccount,
    required TResult orElse(),
  }) {
    if (updateAccount != null) {
      return updateAccount(account, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateAccount value) updateAccount,
  }) {
    return updateAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateAccount value)? updateAccount,
  }) {
    return updateAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateAccount value)? updateAccount,
    required TResult orElse(),
  }) {
    if (updateAccount != null) {
      return updateAccount(this);
    }
    return orElse();
  }
}

abstract class _UpdateAccount implements AccountEvent {
  const factory _UpdateAccount(final Account account, final String? password) =
      _$_UpdateAccount;

  Account get account;
  String? get password;
  @JsonKey(ignore: true)
  _$$_UpdateAccountCopyWith<_$_UpdateAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AccountState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SuccesCopyWith<$Res> {
  factory _$$_SuccesCopyWith(_$_Succes value, $Res Function(_$_Succes) then) =
      __$$_SuccesCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_SuccesCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_Succes>
    implements _$$_SuccesCopyWith<$Res> {
  __$$_SuccesCopyWithImpl(_$_Succes _value, $Res Function(_$_Succes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_Succes(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_Succes implements _Succes {
  const _$_Succes(this.account);

  @override
  final Account account;

  @override
  String toString() {
    return 'AccountState.succes(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Succes &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccesCopyWith<_$_Succes> get copyWith =>
      __$$_SuccesCopyWithImpl<_$_Succes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) {
    return succes(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) {
    return succes?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _Succes implements AccountState {
  const factory _Succes(final Account account) = _$_Succes;

  Account get account;
  @JsonKey(ignore: true)
  _$$_SuccesCopyWith<_$_Succes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccesUpdateCopyWith<$Res> {
  factory _$$_SuccesUpdateCopyWith(
          _$_SuccesUpdate value, $Res Function(_$_SuccesUpdate) then) =
      __$$_SuccesUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccesUpdateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_SuccesUpdate>
    implements _$$_SuccesUpdateCopyWith<$Res> {
  __$$_SuccesUpdateCopyWithImpl(
      _$_SuccesUpdate _value, $Res Function(_$_SuccesUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccesUpdate implements _SuccesUpdate {
  const _$_SuccesUpdate();

  @override
  String toString() {
    return 'AccountState.succesUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SuccesUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) {
    return succesUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) {
    return succesUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) {
    if (succesUpdate != null) {
      return succesUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return succesUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) {
    return succesUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (succesUpdate != null) {
      return succesUpdate(this);
    }
    return orElse();
  }
}

abstract class _SuccesUpdate implements AccountState {
  const factory _SuccesUpdate() = _$_SuccesUpdate;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_Error(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.e);

  @override
  final String e;

  @override
  String toString() {
    return 'AccountState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AccountState {
  const factory _Error(final String e) = _$_Error;

  String get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateErrorCopyWith<$Res> {
  factory _$$_UpdateErrorCopyWith(
          _$_UpdateError value, $Res Function(_$_UpdateError) then) =
      __$$_UpdateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$_UpdateErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_UpdateError>
    implements _$$_UpdateErrorCopyWith<$Res> {
  __$$_UpdateErrorCopyWithImpl(
      _$_UpdateError _value, $Res Function(_$_UpdateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_UpdateError(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateError implements _UpdateError {
  const _$_UpdateError(this.e);

  @override
  final String e;

  @override
  String toString() {
    return 'AccountState.updateError(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateError &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateErrorCopyWith<_$_UpdateError> get copyWith =>
      __$$_UpdateErrorCopyWithImpl<_$_UpdateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Account account) succes,
    required TResult Function() succesUpdate,
    required TResult Function(String e) error,
    required TResult Function(String e) updateError,
  }) {
    return updateError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Account account)? succes,
    TResult? Function()? succesUpdate,
    TResult? Function(String e)? error,
    TResult? Function(String e)? updateError,
  }) {
    return updateError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Account account)? succes,
    TResult Function()? succesUpdate,
    TResult Function(String e)? error,
    TResult Function(String e)? updateError,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Succes value) succes,
    required TResult Function(_SuccesUpdate value) succesUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateError value) updateError,
  }) {
    return updateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_SuccesUpdate value)? succesUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateError value)? updateError,
  }) {
    return updateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Succes value)? succes,
    TResult Function(_SuccesUpdate value)? succesUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateError value)? updateError,
    required TResult orElse(),
  }) {
    if (updateError != null) {
      return updateError(this);
    }
    return orElse();
  }
}

abstract class _UpdateError implements AccountState {
  const factory _UpdateError(final String e) = _$_UpdateError;

  String get e;
  @JsonKey(ignore: true)
  _$$_UpdateErrorCopyWith<_$_UpdateError> get copyWith =>
      throw _privateConstructorUsedError;
}

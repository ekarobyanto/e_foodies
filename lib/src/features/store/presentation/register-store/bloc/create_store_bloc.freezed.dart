// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_store_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateStoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(StoreForm form) submitStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(StoreForm form)? submitStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(StoreForm form)? submitStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submit value) submitStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submit value)? submitStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submit value)? submitStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStoreEventCopyWith<$Res> {
  factory $CreateStoreEventCopyWith(
          CreateStoreEvent value, $Res Function(CreateStoreEvent) then) =
      _$CreateStoreEventCopyWithImpl<$Res, CreateStoreEvent>;
}

/// @nodoc
class _$CreateStoreEventCopyWithImpl<$Res, $Val extends CreateStoreEvent>
    implements $CreateStoreEventCopyWith<$Res> {
  _$CreateStoreEventCopyWithImpl(this._value, this._then);

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
    extends _$CreateStoreEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'CreateStoreEvent.started()';
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
    required TResult Function(StoreForm form) submitStore,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(StoreForm form)? submitStore,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(StoreForm form)? submitStore,
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
    required TResult Function(_Submit value) submitStore,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submit value)? submitStore,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submit value)? submitStore,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CreateStoreEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_SubmitCopyWith<$Res> {
  factory _$$_SubmitCopyWith(_$_Submit value, $Res Function(_$_Submit) then) =
      __$$_SubmitCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreForm form});

  $StoreFormCopyWith<$Res> get form;
}

/// @nodoc
class __$$_SubmitCopyWithImpl<$Res>
    extends _$CreateStoreEventCopyWithImpl<$Res, _$_Submit>
    implements _$$_SubmitCopyWith<$Res> {
  __$$_SubmitCopyWithImpl(_$_Submit _value, $Res Function(_$_Submit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$_Submit(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as StoreForm,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreFormCopyWith<$Res> get form {
    return $StoreFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value));
    });
  }
}

/// @nodoc

class _$_Submit implements _Submit {
  const _$_Submit({required this.form});

  @override
  final StoreForm form;

  @override
  String toString() {
    return 'CreateStoreEvent.submitStore(form: $form)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submit &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitCopyWith<_$_Submit> get copyWith =>
      __$$_SubmitCopyWithImpl<_$_Submit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(StoreForm form) submitStore,
  }) {
    return submitStore(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(StoreForm form)? submitStore,
  }) {
    return submitStore?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(StoreForm form)? submitStore,
    required TResult orElse(),
  }) {
    if (submitStore != null) {
      return submitStore(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submit value) submitStore,
  }) {
    return submitStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submit value)? submitStore,
  }) {
    return submitStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submit value)? submitStore,
    required TResult orElse(),
  }) {
    if (submitStore != null) {
      return submitStore(this);
    }
    return orElse();
  }
}

abstract class _Submit implements CreateStoreEvent {
  const factory _Submit({required final StoreForm form}) = _$_Submit;

  StoreForm get form;
  @JsonKey(ignore: true)
  _$$_SubmitCopyWith<_$_Submit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateStoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onRequest,
    required TResult Function() storeCreated,
    required TResult Function(String error) createStoreFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onRequest,
    TResult? Function()? storeCreated,
    TResult? Function(String error)? createStoreFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onRequest,
    TResult Function()? storeCreated,
    TResult Function(String error)? createStoreFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnRequest value) onRequest,
    required TResult Function(_StoreCreated value) storeCreated,
    required TResult Function(_Failure value) createStoreFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnRequest value)? onRequest,
    TResult? Function(_StoreCreated value)? storeCreated,
    TResult? Function(_Failure value)? createStoreFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnRequest value)? onRequest,
    TResult Function(_StoreCreated value)? storeCreated,
    TResult Function(_Failure value)? createStoreFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStoreStateCopyWith<$Res> {
  factory $CreateStoreStateCopyWith(
          CreateStoreState value, $Res Function(CreateStoreState) then) =
      _$CreateStoreStateCopyWithImpl<$Res, CreateStoreState>;
}

/// @nodoc
class _$CreateStoreStateCopyWithImpl<$Res, $Val extends CreateStoreState>
    implements $CreateStoreStateCopyWith<$Res> {
  _$CreateStoreStateCopyWithImpl(this._value, this._then);

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
    extends _$CreateStoreStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CreateStoreState.initial()';
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
    required TResult Function() onRequest,
    required TResult Function() storeCreated,
    required TResult Function(String error) createStoreFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onRequest,
    TResult? Function()? storeCreated,
    TResult? Function(String error)? createStoreFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onRequest,
    TResult Function()? storeCreated,
    TResult Function(String error)? createStoreFailed,
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
    required TResult Function(_OnRequest value) onRequest,
    required TResult Function(_StoreCreated value) storeCreated,
    required TResult Function(_Failure value) createStoreFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnRequest value)? onRequest,
    TResult? Function(_StoreCreated value)? storeCreated,
    TResult? Function(_Failure value)? createStoreFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnRequest value)? onRequest,
    TResult Function(_StoreCreated value)? storeCreated,
    TResult Function(_Failure value)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateStoreState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_OnRequestCopyWith<$Res> {
  factory _$$_OnRequestCopyWith(
          _$_OnRequest value, $Res Function(_$_OnRequest) then) =
      __$$_OnRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnRequestCopyWithImpl<$Res>
    extends _$CreateStoreStateCopyWithImpl<$Res, _$_OnRequest>
    implements _$$_OnRequestCopyWith<$Res> {
  __$$_OnRequestCopyWithImpl(
      _$_OnRequest _value, $Res Function(_$_OnRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnRequest implements _OnRequest {
  const _$_OnRequest();

  @override
  String toString() {
    return 'CreateStoreState.onRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onRequest,
    required TResult Function() storeCreated,
    required TResult Function(String error) createStoreFailed,
  }) {
    return onRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onRequest,
    TResult? Function()? storeCreated,
    TResult? Function(String error)? createStoreFailed,
  }) {
    return onRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onRequest,
    TResult Function()? storeCreated,
    TResult Function(String error)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (onRequest != null) {
      return onRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnRequest value) onRequest,
    required TResult Function(_StoreCreated value) storeCreated,
    required TResult Function(_Failure value) createStoreFailed,
  }) {
    return onRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnRequest value)? onRequest,
    TResult? Function(_StoreCreated value)? storeCreated,
    TResult? Function(_Failure value)? createStoreFailed,
  }) {
    return onRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnRequest value)? onRequest,
    TResult Function(_StoreCreated value)? storeCreated,
    TResult Function(_Failure value)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (onRequest != null) {
      return onRequest(this);
    }
    return orElse();
  }
}

abstract class _OnRequest implements CreateStoreState {
  const factory _OnRequest() = _$_OnRequest;
}

/// @nodoc
abstract class _$$_StoreCreatedCopyWith<$Res> {
  factory _$$_StoreCreatedCopyWith(
          _$_StoreCreated value, $Res Function(_$_StoreCreated) then) =
      __$$_StoreCreatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StoreCreatedCopyWithImpl<$Res>
    extends _$CreateStoreStateCopyWithImpl<$Res, _$_StoreCreated>
    implements _$$_StoreCreatedCopyWith<$Res> {
  __$$_StoreCreatedCopyWithImpl(
      _$_StoreCreated _value, $Res Function(_$_StoreCreated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StoreCreated implements _StoreCreated {
  const _$_StoreCreated();

  @override
  String toString() {
    return 'CreateStoreState.storeCreated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StoreCreated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onRequest,
    required TResult Function() storeCreated,
    required TResult Function(String error) createStoreFailed,
  }) {
    return storeCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onRequest,
    TResult? Function()? storeCreated,
    TResult? Function(String error)? createStoreFailed,
  }) {
    return storeCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onRequest,
    TResult Function()? storeCreated,
    TResult Function(String error)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (storeCreated != null) {
      return storeCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnRequest value) onRequest,
    required TResult Function(_StoreCreated value) storeCreated,
    required TResult Function(_Failure value) createStoreFailed,
  }) {
    return storeCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnRequest value)? onRequest,
    TResult? Function(_StoreCreated value)? storeCreated,
    TResult? Function(_Failure value)? createStoreFailed,
  }) {
    return storeCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnRequest value)? onRequest,
    TResult Function(_StoreCreated value)? storeCreated,
    TResult Function(_Failure value)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (storeCreated != null) {
      return storeCreated(this);
    }
    return orElse();
  }
}

abstract class _StoreCreated implements CreateStoreState {
  const factory _StoreCreated() = _$_StoreCreated;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$CreateStoreStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Failure(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CreateStoreState.createStoreFailed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() onRequest,
    required TResult Function() storeCreated,
    required TResult Function(String error) createStoreFailed,
  }) {
    return createStoreFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? onRequest,
    TResult? Function()? storeCreated,
    TResult? Function(String error)? createStoreFailed,
  }) {
    return createStoreFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? onRequest,
    TResult Function()? storeCreated,
    TResult Function(String error)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (createStoreFailed != null) {
      return createStoreFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OnRequest value) onRequest,
    required TResult Function(_StoreCreated value) storeCreated,
    required TResult Function(_Failure value) createStoreFailed,
  }) {
    return createStoreFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OnRequest value)? onRequest,
    TResult? Function(_StoreCreated value)? storeCreated,
    TResult? Function(_Failure value)? createStoreFailed,
  }) {
    return createStoreFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OnRequest value)? onRequest,
    TResult Function(_StoreCreated value)? storeCreated,
    TResult Function(_Failure value)? createStoreFailed,
    required TResult orElse(),
  }) {
    if (createStoreFailed != null) {
      return createStoreFailed(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CreateStoreState {
  const factory _Failure({required final String error}) = _$_Failure;

  String get error;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

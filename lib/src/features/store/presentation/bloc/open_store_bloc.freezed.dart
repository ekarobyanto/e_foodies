// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_store_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OpenStoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) viewStore,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? viewStore,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? viewStore,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStore value) viewStore,
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStore value)? viewStore,
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStore value)? viewStore,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenStoreEventCopyWith<$Res> {
  factory $OpenStoreEventCopyWith(
          OpenStoreEvent value, $Res Function(OpenStoreEvent) then) =
      _$OpenStoreEventCopyWithImpl<$Res, OpenStoreEvent>;
}

/// @nodoc
class _$OpenStoreEventCopyWithImpl<$Res, $Val extends OpenStoreEvent>
    implements $OpenStoreEventCopyWith<$Res> {
  _$OpenStoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ViewStoreCopyWith<$Res> {
  factory _$$_ViewStoreCopyWith(
          _$_ViewStore value, $Res Function(_$_ViewStore) then) =
      __$$_ViewStoreCopyWithImpl<$Res>;
  @useResult
  $Res call({String storeId});
}

/// @nodoc
class __$$_ViewStoreCopyWithImpl<$Res>
    extends _$OpenStoreEventCopyWithImpl<$Res, _$_ViewStore>
    implements _$$_ViewStoreCopyWith<$Res> {
  __$$_ViewStoreCopyWithImpl(
      _$_ViewStore _value, $Res Function(_$_ViewStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
  }) {
    return _then(_$_ViewStore(
      null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ViewStore implements _ViewStore {
  const _$_ViewStore(this.storeId);

  @override
  final String storeId;

  @override
  String toString() {
    return 'OpenStoreEvent.viewStore(storeId: $storeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewStore &&
            (identical(other.storeId, storeId) || other.storeId == storeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewStoreCopyWith<_$_ViewStore> get copyWith =>
      __$$_ViewStoreCopyWithImpl<_$_ViewStore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String storeId) viewStore,
    required TResult Function() started,
  }) {
    return viewStore(storeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? viewStore,
    TResult? Function()? started,
  }) {
    return viewStore?.call(storeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? viewStore,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (viewStore != null) {
      return viewStore(storeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStore value) viewStore,
    required TResult Function(_Started value) started,
  }) {
    return viewStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStore value)? viewStore,
    TResult? Function(_Started value)? started,
  }) {
    return viewStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStore value)? viewStore,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (viewStore != null) {
      return viewStore(this);
    }
    return orElse();
  }
}

abstract class _ViewStore implements OpenStoreEvent {
  const factory _ViewStore(final String storeId) = _$_ViewStore;

  String get storeId;
  @JsonKey(ignore: true)
  _$$_ViewStoreCopyWith<_$_ViewStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$OpenStoreEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'OpenStoreEvent.started()';
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
    required TResult Function(String storeId) viewStore,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String storeId)? viewStore,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String storeId)? viewStore,
    TResult Function()? started,
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
    required TResult Function(_ViewStore value) viewStore,
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStore value)? viewStore,
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStore value)? viewStore,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OpenStoreEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$OpenStoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Store store) storeLoaded,
    required TResult Function(String e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Store store)? storeLoaded,
    TResult? Function(String e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Store store)? storeLoaded,
    TResult Function(String e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_StoreLoaded value) storeLoaded,
    required TResult Function(_StoreError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_StoreLoaded value)? storeLoaded,
    TResult? Function(_StoreError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_StoreLoaded value)? storeLoaded,
    TResult Function(_StoreError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenStoreStateCopyWith<$Res> {
  factory $OpenStoreStateCopyWith(
          OpenStoreState value, $Res Function(OpenStoreState) then) =
      _$OpenStoreStateCopyWithImpl<$Res, OpenStoreState>;
}

/// @nodoc
class _$OpenStoreStateCopyWithImpl<$Res, $Val extends OpenStoreState>
    implements $OpenStoreStateCopyWith<$Res> {
  _$OpenStoreStateCopyWithImpl(this._value, this._then);

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
    extends _$OpenStoreStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'OpenStoreState.initial()';
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
    required TResult Function(Store store) storeLoaded,
    required TResult Function(String e) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Store store)? storeLoaded,
    TResult? Function(String e)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Store store)? storeLoaded,
    TResult Function(String e)? error,
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
    required TResult Function(_StoreLoaded value) storeLoaded,
    required TResult Function(_StoreError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_StoreLoaded value)? storeLoaded,
    TResult? Function(_StoreError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_StoreLoaded value)? storeLoaded,
    TResult Function(_StoreError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OpenStoreState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_StoreLoadedCopyWith<$Res> {
  factory _$$_StoreLoadedCopyWith(
          _$_StoreLoaded value, $Res Function(_$_StoreLoaded) then) =
      __$$_StoreLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Store store});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$_StoreLoadedCopyWithImpl<$Res>
    extends _$OpenStoreStateCopyWithImpl<$Res, _$_StoreLoaded>
    implements _$$_StoreLoadedCopyWith<$Res> {
  __$$_StoreLoadedCopyWithImpl(
      _$_StoreLoaded _value, $Res Function(_$_StoreLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$_StoreLoaded(
      null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value));
    });
  }
}

/// @nodoc

class _$_StoreLoaded implements _StoreLoaded {
  const _$_StoreLoaded(this.store);

  @override
  final Store store;

  @override
  String toString() {
    return 'OpenStoreState.storeLoaded(store: $store)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreLoaded &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreLoadedCopyWith<_$_StoreLoaded> get copyWith =>
      __$$_StoreLoadedCopyWithImpl<_$_StoreLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Store store) storeLoaded,
    required TResult Function(String e) error,
  }) {
    return storeLoaded(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Store store)? storeLoaded,
    TResult? Function(String e)? error,
  }) {
    return storeLoaded?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Store store)? storeLoaded,
    TResult Function(String e)? error,
    required TResult orElse(),
  }) {
    if (storeLoaded != null) {
      return storeLoaded(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_StoreLoaded value) storeLoaded,
    required TResult Function(_StoreError value) error,
  }) {
    return storeLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_StoreLoaded value)? storeLoaded,
    TResult? Function(_StoreError value)? error,
  }) {
    return storeLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_StoreLoaded value)? storeLoaded,
    TResult Function(_StoreError value)? error,
    required TResult orElse(),
  }) {
    if (storeLoaded != null) {
      return storeLoaded(this);
    }
    return orElse();
  }
}

abstract class _StoreLoaded implements OpenStoreState {
  const factory _StoreLoaded(final Store store) = _$_StoreLoaded;

  Store get store;
  @JsonKey(ignore: true)
  _$$_StoreLoadedCopyWith<_$_StoreLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StoreErrorCopyWith<$Res> {
  factory _$$_StoreErrorCopyWith(
          _$_StoreError value, $Res Function(_$_StoreError) then) =
      __$$_StoreErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$_StoreErrorCopyWithImpl<$Res>
    extends _$OpenStoreStateCopyWithImpl<$Res, _$_StoreError>
    implements _$$_StoreErrorCopyWith<$Res> {
  __$$_StoreErrorCopyWithImpl(
      _$_StoreError _value, $Res Function(_$_StoreError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_StoreError(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StoreError implements _StoreError {
  const _$_StoreError(this.e);

  @override
  final String e;

  @override
  String toString() {
    return 'OpenStoreState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreError &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreErrorCopyWith<_$_StoreError> get copyWith =>
      __$$_StoreErrorCopyWithImpl<_$_StoreError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Store store) storeLoaded,
    required TResult Function(String e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Store store)? storeLoaded,
    TResult? Function(String e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Store store)? storeLoaded,
    TResult Function(String e)? error,
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
    required TResult Function(_StoreLoaded value) storeLoaded,
    required TResult Function(_StoreError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_StoreLoaded value)? storeLoaded,
    TResult? Function(_StoreError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_StoreLoaded value)? storeLoaded,
    TResult Function(_StoreError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _StoreError implements OpenStoreState {
  const factory _StoreError(final String e) = _$_StoreError;

  String get e;
  @JsonKey(ignore: true)
  _$$_StoreErrorCopyWith<_$_StoreError> get copyWith =>
      throw _privateConstructorUsedError;
}

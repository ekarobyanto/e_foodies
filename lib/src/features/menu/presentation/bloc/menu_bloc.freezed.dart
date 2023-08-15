// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuEvent {
  int get pageKey => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageKey, int pageSize) started,
    required TResult Function(int pageKey, int pageSize) nextpage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageKey, int pageSize)? started,
    TResult? Function(int pageKey, int pageSize)? nextpage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageKey, int pageSize)? started,
    TResult Function(int pageKey, int pageSize)? nextpage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NextPage value) nextpage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NextPage value)? nextpage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NextPage value)? nextpage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuEventCopyWith<MenuEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuEventCopyWith<$Res> {
  factory $MenuEventCopyWith(MenuEvent value, $Res Function(MenuEvent) then) =
      _$MenuEventCopyWithImpl<$Res, MenuEvent>;
  @useResult
  $Res call({int pageKey, int pageSize});
}

/// @nodoc
class _$MenuEventCopyWithImpl<$Res, $Val extends MenuEvent>
    implements $MenuEventCopyWith<$Res> {
  _$MenuEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> implements $MenuEventCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageKey, int pageSize});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_$_Started(
      null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.pageKey, this.pageSize);

  @override
  final int pageKey;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'MenuEvent.started(pageKey: $pageKey, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageKey, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageKey, int pageSize) started,
    required TResult Function(int pageKey, int pageSize) nextpage,
  }) {
    return started(pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageKey, int pageSize)? started,
    TResult? Function(int pageKey, int pageSize)? nextpage,
  }) {
    return started?.call(pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageKey, int pageSize)? started,
    TResult Function(int pageKey, int pageSize)? nextpage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(pageKey, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NextPage value) nextpage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NextPage value)? nextpage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NextPage value)? nextpage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MenuEvent {
  const factory _Started(final int pageKey, final int pageSize) = _$_Started;

  @override
  int get pageKey;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NextPageCopyWith<$Res> implements $MenuEventCopyWith<$Res> {
  factory _$$_NextPageCopyWith(
          _$_NextPage value, $Res Function(_$_NextPage) then) =
      __$$_NextPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageKey, int pageSize});
}

/// @nodoc
class __$$_NextPageCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$_NextPage>
    implements _$$_NextPageCopyWith<$Res> {
  __$$_NextPageCopyWithImpl(
      _$_NextPage _value, $Res Function(_$_NextPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_$_NextPage(
      null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NextPage implements _NextPage {
  const _$_NextPage(this.pageKey, this.pageSize);

  @override
  final int pageKey;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'MenuEvent.nextpage(pageKey: $pageKey, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextPage &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageKey, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextPageCopyWith<_$_NextPage> get copyWith =>
      __$$_NextPageCopyWithImpl<_$_NextPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pageKey, int pageSize) started,
    required TResult Function(int pageKey, int pageSize) nextpage,
  }) {
    return nextpage(pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pageKey, int pageSize)? started,
    TResult? Function(int pageKey, int pageSize)? nextpage,
  }) {
    return nextpage?.call(pageKey, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pageKey, int pageSize)? started,
    TResult Function(int pageKey, int pageSize)? nextpage,
    required TResult orElse(),
  }) {
    if (nextpage != null) {
      return nextpage(pageKey, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_NextPage value) nextpage,
  }) {
    return nextpage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_NextPage value)? nextpage,
  }) {
    return nextpage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_NextPage value)? nextpage,
    required TResult orElse(),
  }) {
    if (nextpage != null) {
      return nextpage(this);
    }
    return orElse();
  }
}

abstract class _NextPage implements MenuEvent {
  const factory _NextPage(final int pageKey, final int pageSize) = _$_NextPage;

  @override
  int get pageKey;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_NextPageCopyWith<_$_NextPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenuState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) =
      _$MenuStateCopyWithImpl<$Res, MenuState>;
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res, $Val extends MenuState>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

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
    extends _$MenuStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'MenuState.initial()';
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
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MenuState {
  const factory _Initial() = _$_Initial;
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
    extends _$MenuStateCopyWithImpl<$Res, _$_Error>
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
    return 'MenuState.error(e: $e)';
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
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MenuState {
  const factory _Error(final String e) = _$_Error;

  String get e;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Pagination<Menu> menus});

  $PaginationCopyWith<Menu, $Res> get menus;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
  }) {
    return _then(_$_Success(
      null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Pagination<Menu>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Menu, $Res> get menus {
    return $PaginationCopyWith<Menu, $Res>(_value.menus, (value) {
      return _then(_value.copyWith(menus: value));
    });
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.menus);

  @override
  final Pagination<Menu> menus;

  @override
  String toString() {
    return 'MenuState.success(menus: $menus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            (identical(other.menus, menus) || other.menus == menus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) {
    return success(menus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) {
    return success?.call(menus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(menus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MenuState {
  const factory _Success(final Pagination<Menu> menus) = _$_Success;

  Pagination<Menu> get menus;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatedCopyWith<$Res> {
  factory _$$_UpdatedCopyWith(
          _$_Updated value, $Res Function(_$_Updated) then) =
      __$$_UpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call({Pagination<Menu> menus});

  $PaginationCopyWith<Menu, $Res> get menus;
}

/// @nodoc
class __$$_UpdatedCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$_Updated>
    implements _$$_UpdatedCopyWith<$Res> {
  __$$_UpdatedCopyWithImpl(_$_Updated _value, $Res Function(_$_Updated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menus = null,
  }) {
    return _then(_$_Updated(
      null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Pagination<Menu>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Menu, $Res> get menus {
    return $PaginationCopyWith<Menu, $Res>(_value.menus, (value) {
      return _then(_value.copyWith(menus: value));
    });
  }
}

/// @nodoc

class _$_Updated implements _Updated {
  const _$_Updated(this.menus);

  @override
  final Pagination<Menu> menus;

  @override
  String toString() {
    return 'MenuState.pageUpdated(menus: $menus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updated &&
            (identical(other.menus, menus) || other.menus == menus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatedCopyWith<_$_Updated> get copyWith =>
      __$$_UpdatedCopyWithImpl<_$_Updated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) {
    return pageUpdated(menus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) {
    return pageUpdated?.call(menus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
    required TResult orElse(),
  }) {
    if (pageUpdated != null) {
      return pageUpdated(menus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) {
    return pageUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) {
    return pageUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) {
    if (pageUpdated != null) {
      return pageUpdated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements MenuState {
  const factory _Updated(final Pagination<Menu> menus) = _$_Updated;

  Pagination<Menu> get menus;
  @JsonKey(ignore: true)
  _$$_UpdatedCopyWith<_$_Updated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PageErrorCopyWith<$Res> {
  factory _$$_PageErrorCopyWith(
          _$_PageError value, $Res Function(_$_PageError) then) =
      __$$_PageErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$_PageErrorCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$_PageError>
    implements _$$_PageErrorCopyWith<$Res> {
  __$$_PageErrorCopyWithImpl(
      _$_PageError _value, $Res Function(_$_PageError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_PageError(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PageError implements _PageError {
  const _$_PageError(this.e);

  @override
  final String e;

  @override
  String toString() {
    return 'MenuState.pageError(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageError &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageErrorCopyWith<_$_PageError> get copyWith =>
      __$$_PageErrorCopyWithImpl<_$_PageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String e) error,
    required TResult Function(Pagination<Menu> menus) success,
    required TResult Function(Pagination<Menu> menus) pageUpdated,
    required TResult Function(String e) pageError,
  }) {
    return pageError(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String e)? error,
    TResult? Function(Pagination<Menu> menus)? success,
    TResult? Function(Pagination<Menu> menus)? pageUpdated,
    TResult? Function(String e)? pageError,
  }) {
    return pageError?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String e)? error,
    TResult Function(Pagination<Menu> menus)? success,
    TResult Function(Pagination<Menu> menus)? pageUpdated,
    TResult Function(String e)? pageError,
    required TResult orElse(),
  }) {
    if (pageError != null) {
      return pageError(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
    required TResult Function(_Updated value) pageUpdated,
    required TResult Function(_PageError value) pageError,
  }) {
    return pageError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
    TResult? Function(_Updated value)? pageUpdated,
    TResult? Function(_PageError value)? pageError,
  }) {
    return pageError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    TResult Function(_Updated value)? pageUpdated,
    TResult Function(_PageError value)? pageError,
    required TResult orElse(),
  }) {
    if (pageError != null) {
      return pageError(this);
    }
    return orElse();
  }
}

abstract class _PageError implements MenuState {
  const factory _PageError(final String e) = _$_PageError;

  String get e;
  @JsonKey(ignore: true)
  _$$_PageErrorCopyWith<_$_PageError> get copyWith =>
      throw _privateConstructorUsedError;
}

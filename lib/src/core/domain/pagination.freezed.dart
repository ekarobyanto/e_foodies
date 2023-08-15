// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pagination<T> _$PaginationFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Pagination<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Pagination<T> {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get prev => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<T, Pagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<T, $Res> {
  factory $PaginationCopyWith(
          Pagination<T> value, $Res Function(Pagination<T>) then) =
      _$PaginationCopyWithImpl<T, $Res, Pagination<T>>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      @JsonKey(name: 'previous') String? prev,
      List<T> results});
}

/// @nodoc
class _$PaginationCopyWithImpl<T, $Res, $Val extends Pagination<T>>
    implements $PaginationCopyWith<T, $Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<T, $Res>
    implements $PaginationCopyWith<T, $Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination<T> value, $Res Function(_$_Pagination<T>) then) =
      __$$_PaginationCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      @JsonKey(name: 'previous') String? prev,
      List<T> results});
}

/// @nodoc
class __$$_PaginationCopyWithImpl<T, $Res>
    extends _$PaginationCopyWithImpl<T, $Res, _$_Pagination<T>>
    implements _$$_PaginationCopyWith<T, $Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination<T> _value, $Res Function(_$_Pagination<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? prev = freezed,
    Object? results = null,
  }) {
    return _then(_$_Pagination<T>(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Pagination<T> implements _Pagination<T> {
  _$_Pagination(
      {this.count,
      this.next,
      @JsonKey(name: 'previous') this.prev,
      required final List<T> results})
      : _results = results;

  factory _$_Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PaginationFromJson(json, fromJsonT);

  @override
  final int? count;
  @override
  final String? next;
  @override
  @JsonKey(name: 'previous')
  final String? prev;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'Pagination<$T>(count: $count, next: $next, prev: $prev, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, prev,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationCopyWith<T, _$_Pagination<T>> get copyWith =>
      __$$_PaginationCopyWithImpl<T, _$_Pagination<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PaginationToJson<T>(this, toJsonT);
  }
}

abstract class _Pagination<T> implements Pagination<T> {
  factory _Pagination(
      {final int? count,
      final String? next,
      @JsonKey(name: 'previous') final String? prev,
      required final List<T> results}) = _$_Pagination<T>;

  factory _Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_Pagination<T>.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  @JsonKey(name: 'previous')
  String? get prev;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<T, _$_Pagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

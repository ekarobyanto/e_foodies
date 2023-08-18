// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreForm _$StoreFormFromJson(Map<String, dynamic> json) {
  return _StoreForm.fromJson(json);
}

/// @nodoc
mixin _$StoreForm {
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get closeTime => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreFormCopyWith<StoreForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreFormCopyWith<$Res> {
  factory $StoreFormCopyWith(StoreForm value, $Res Function(StoreForm) then) =
      _$StoreFormCopyWithImpl<$Res, StoreForm>;
  @useResult
  $Res call(
      {String name,
      String desc,
      String address,
      String phone,
      String openTime,
      String closeTime,
      String imagePath});
}

/// @nodoc
class _$StoreFormCopyWithImpl<$Res, $Val extends StoreForm>
    implements $StoreFormCopyWith<$Res> {
  _$StoreFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? address = null,
    Object? phone = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreFormCopyWith<$Res> implements $StoreFormCopyWith<$Res> {
  factory _$$_StoreFormCopyWith(
          _$_StoreForm value, $Res Function(_$_StoreForm) then) =
      __$$_StoreFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String desc,
      String address,
      String phone,
      String openTime,
      String closeTime,
      String imagePath});
}

/// @nodoc
class __$$_StoreFormCopyWithImpl<$Res>
    extends _$StoreFormCopyWithImpl<$Res, _$_StoreForm>
    implements _$$_StoreFormCopyWith<$Res> {
  __$$_StoreFormCopyWithImpl(
      _$_StoreForm _value, $Res Function(_$_StoreForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? address = null,
    Object? phone = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? imagePath = null,
  }) {
    return _then(_$_StoreForm(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreForm implements _StoreForm {
  _$_StoreForm(
      {required this.name,
      required this.desc,
      required this.address,
      required this.phone,
      required this.openTime,
      required this.closeTime,
      required this.imagePath});

  factory _$_StoreForm.fromJson(Map<String, dynamic> json) =>
      _$$_StoreFormFromJson(json);

  @override
  final String name;
  @override
  final String desc;
  @override
  final String address;
  @override
  final String phone;
  @override
  final String openTime;
  @override
  final String closeTime;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'StoreForm(name: $name, desc: $desc, address: $address, phone: $phone, openTime: $openTime, closeTime: $closeTime, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreForm &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, desc, address, phone, openTime, closeTime, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreFormCopyWith<_$_StoreForm> get copyWith =>
      __$$_StoreFormCopyWithImpl<_$_StoreForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreFormToJson(
      this,
    );
  }
}

abstract class _StoreForm implements StoreForm {
  factory _StoreForm(
      {required final String name,
      required final String desc,
      required final String address,
      required final String phone,
      required final String openTime,
      required final String closeTime,
      required final String imagePath}) = _$_StoreForm;

  factory _StoreForm.fromJson(Map<String, dynamic> json) =
      _$_StoreForm.fromJson;

  @override
  String get name;
  @override
  String get desc;
  @override
  String get address;
  @override
  String get phone;
  @override
  String get openTime;
  @override
  String get closeTime;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_StoreFormCopyWith<_$_StoreForm> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuForm {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuFormCopyWith<MenuForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuFormCopyWith<$Res> {
  factory $MenuFormCopyWith(MenuForm value, $Res Function(MenuForm) then) =
      _$MenuFormCopyWithImpl<$Res, MenuForm>;
  @useResult
  $Res call(
      {String name,
      String description,
      String price,
      List<String> ingredients,
      String image});
}

/// @nodoc
class _$MenuFormCopyWithImpl<$Res, $Val extends MenuForm>
    implements $MenuFormCopyWith<$Res> {
  _$MenuFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? ingredients = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuFormCopyWith<$Res> implements $MenuFormCopyWith<$Res> {
  factory _$$_MenuFormCopyWith(
          _$_MenuForm value, $Res Function(_$_MenuForm) then) =
      __$$_MenuFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String price,
      List<String> ingredients,
      String image});
}

/// @nodoc
class __$$_MenuFormCopyWithImpl<$Res>
    extends _$MenuFormCopyWithImpl<$Res, _$_MenuForm>
    implements _$$_MenuFormCopyWith<$Res> {
  __$$_MenuFormCopyWithImpl(
      _$_MenuForm _value, $Res Function(_$_MenuForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? ingredients = null,
    Object? image = null,
  }) {
    return _then(_$_MenuForm(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MenuForm implements _MenuForm {
  _$_MenuForm(
      {required this.name,
      required this.description,
      required this.price,
      required final List<String> ingredients,
      required this.image})
      : _ingredients = ingredients;

  @override
  final String name;
  @override
  final String description;
  @override
  final String price;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String image;

  @override
  String toString() {
    return 'MenuForm(name: $name, description: $description, price: $price, ingredients: $ingredients, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuForm &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description, price,
      const DeepCollectionEquality().hash(_ingredients), image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuFormCopyWith<_$_MenuForm> get copyWith =>
      __$$_MenuFormCopyWithImpl<_$_MenuForm>(this, _$identity);
}

abstract class _MenuForm implements MenuForm {
  factory _MenuForm(
      {required final String name,
      required final String description,
      required final String price,
      required final List<String> ingredients,
      required final String image}) = _$_MenuForm;

  @override
  String get name;
  @override
  String get description;
  @override
  String get price;
  @override
  List<String> get ingredients;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_MenuFormCopyWith<_$_MenuForm> get copyWith =>
      throw _privateConstructorUsedError;
}

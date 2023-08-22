// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderForm {
  Menu get menu => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderFormCopyWith<OrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderFormCopyWith<$Res> {
  factory $OrderFormCopyWith(OrderForm value, $Res Function(OrderForm) then) =
      _$OrderFormCopyWithImpl<$Res, OrderForm>;
  @useResult
  $Res call({Menu menu, int quantity, String? note});

  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class _$OrderFormCopyWithImpl<$Res, $Val extends OrderForm>
    implements $OrderFormCopyWith<$Res> {
  _$OrderFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? quantity = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res> get menu {
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderFormCopyWith<$Res> implements $OrderFormCopyWith<$Res> {
  factory _$$_OrderFormCopyWith(
          _$_OrderForm value, $Res Function(_$_OrderForm) then) =
      __$$_OrderFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Menu menu, int quantity, String? note});

  @override
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_OrderFormCopyWithImpl<$Res>
    extends _$OrderFormCopyWithImpl<$Res, _$_OrderForm>
    implements _$$_OrderFormCopyWith<$Res> {
  __$$_OrderFormCopyWithImpl(
      _$_OrderForm _value, $Res Function(_$_OrderForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? quantity = null,
    Object? note = freezed,
  }) {
    return _then(_$_OrderForm(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_OrderForm implements _OrderForm {
  _$_OrderForm({required this.menu, required this.quantity, this.note});

  @override
  final Menu menu;
  @override
  final int quantity;
  @override
  final String? note;

  @override
  String toString() {
    return 'OrderForm(menu: $menu, quantity: $quantity, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderForm &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu, quantity, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderFormCopyWith<_$_OrderForm> get copyWith =>
      __$$_OrderFormCopyWithImpl<_$_OrderForm>(this, _$identity);
}

abstract class _OrderForm implements OrderForm {
  factory _OrderForm(
      {required final Menu menu,
      required final int quantity,
      final String? note}) = _$_OrderForm;

  @override
  Menu get menu;
  @override
  int get quantity;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_OrderFormCopyWith<_$_OrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

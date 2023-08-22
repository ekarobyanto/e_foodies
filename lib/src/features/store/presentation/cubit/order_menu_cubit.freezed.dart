// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderMenuState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<OrderForm> orderForm) orderUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<OrderForm> orderForm)? orderUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<OrderForm> orderForm)? orderUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OrderUpdated value) orderUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OrderUpdated value)? orderUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OrderUpdated value)? orderUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderMenuStateCopyWith<$Res> {
  factory $OrderMenuStateCopyWith(
          OrderMenuState value, $Res Function(OrderMenuState) then) =
      _$OrderMenuStateCopyWithImpl<$Res, OrderMenuState>;
}

/// @nodoc
class _$OrderMenuStateCopyWithImpl<$Res, $Val extends OrderMenuState>
    implements $OrderMenuStateCopyWith<$Res> {
  _$OrderMenuStateCopyWithImpl(this._value, this._then);

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
    extends _$OrderMenuStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'OrderMenuState.initial()';
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
    required TResult Function(List<OrderForm> orderForm) orderUpdated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<OrderForm> orderForm)? orderUpdated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<OrderForm> orderForm)? orderUpdated,
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
    required TResult Function(_OrderUpdated value) orderUpdated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OrderUpdated value)? orderUpdated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OrderUpdated value)? orderUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrderMenuState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_OrderUpdatedCopyWith<$Res> {
  factory _$$_OrderUpdatedCopyWith(
          _$_OrderUpdated value, $Res Function(_$_OrderUpdated) then) =
      __$$_OrderUpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderForm> orderForm});
}

/// @nodoc
class __$$_OrderUpdatedCopyWithImpl<$Res>
    extends _$OrderMenuStateCopyWithImpl<$Res, _$_OrderUpdated>
    implements _$$_OrderUpdatedCopyWith<$Res> {
  __$$_OrderUpdatedCopyWithImpl(
      _$_OrderUpdated _value, $Res Function(_$_OrderUpdated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderForm = null,
  }) {
    return _then(_$_OrderUpdated(
      orderForm: null == orderForm
          ? _value._orderForm
          : orderForm // ignore: cast_nullable_to_non_nullable
              as List<OrderForm>,
    ));
  }
}

/// @nodoc

class _$_OrderUpdated implements _OrderUpdated {
  const _$_OrderUpdated({required final List<OrderForm> orderForm})
      : _orderForm = orderForm;

  final List<OrderForm> _orderForm;
  @override
  List<OrderForm> get orderForm {
    if (_orderForm is EqualUnmodifiableListView) return _orderForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderForm);
  }

  @override
  String toString() {
    return 'OrderMenuState.orderUpdated(orderForm: $orderForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderUpdated &&
            const DeepCollectionEquality()
                .equals(other._orderForm, _orderForm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orderForm));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderUpdatedCopyWith<_$_OrderUpdated> get copyWith =>
      __$$_OrderUpdatedCopyWithImpl<_$_OrderUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<OrderForm> orderForm) orderUpdated,
  }) {
    return orderUpdated(orderForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<OrderForm> orderForm)? orderUpdated,
  }) {
    return orderUpdated?.call(orderForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<OrderForm> orderForm)? orderUpdated,
    required TResult orElse(),
  }) {
    if (orderUpdated != null) {
      return orderUpdated(orderForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_OrderUpdated value) orderUpdated,
  }) {
    return orderUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_OrderUpdated value)? orderUpdated,
  }) {
    return orderUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_OrderUpdated value)? orderUpdated,
    required TResult orElse(),
  }) {
    if (orderUpdated != null) {
      return orderUpdated(this);
    }
    return orElse();
  }
}

abstract class _OrderUpdated implements OrderMenuState {
  const factory _OrderUpdated({required final List<OrderForm> orderForm}) =
      _$_OrderUpdated;

  List<OrderForm> get orderForm;
  @JsonKey(ignore: true)
  _$$_OrderUpdatedCopyWith<_$_OrderUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

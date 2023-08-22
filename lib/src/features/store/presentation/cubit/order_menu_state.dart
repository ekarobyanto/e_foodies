part of 'order_menu_cubit.dart';

@freezed
class OrderMenuState with _$OrderMenuState {
  const factory OrderMenuState.initial() = _Initial;
  const factory OrderMenuState.orderUpdated({
    required List<OrderForm> orderForm,
  }) = _OrderUpdated;
}

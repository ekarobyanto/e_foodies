import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/features/store/domain/order-form/order_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_menu_state.dart';
part 'order_menu_cubit.freezed.dart';

class OrderMenuCubit extends Cubit<OrderMenuState> {
  List<OrderForm> orders = [];
  OrderMenuCubit() : super(const OrderMenuState.initial());

  updateOrder({required OrderForm form}) {
    if (orders.map((e) => e.menu.id == form.menu.id).contains(true)) {
      orders = orders.map((order) {
        if (order.menu.id == form.menu.id) {
          return form;
        } else {
          return order;
        }
      }).toList();
      emit(OrderMenuState.orderUpdated(orderForm: orders));
    } else {
      orders = [...orders, form];
      emit(OrderMenuState.orderUpdated(orderForm: orders));
    }
  }

  removeOrder({required OrderForm form}) {
    orders = orders.where((order) => order.menu.id != form.menu.id).toList();
    emit(OrderMenuState.orderUpdated(orderForm: orders)); 
  }

  @override
  void onChange(Change<OrderMenuState> change) {
    log(change.toString());
    super.onChange(change);
  }
}

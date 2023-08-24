import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/order.dart';
import '../../domain/repositories/order_repository.dart';
import 'order_state.dart';

class OrdersCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrdersCubit(this._orderRepository) : super(StateSuccess([]));

  Future<void> getOrders() async {
    emit(StateLoading());
    emit(await _getOrders());
  }

  Future<void> removeOrder({required Order order}) async {
    emit(StateLoading());
    await _orderRepository.removeOrder(order);
    emit(await _getOrders());
  }

  Future<void> saveOrder({required Order order}) async {
    emit(StateLoading());
    await _orderRepository.saveOrder(order);
    emit(await _getOrders());
  }

  Future<OrderState> _getOrders() async {
    final orders = await _orderRepository.getOrders();
    return StateSuccess(orders);
  }
}

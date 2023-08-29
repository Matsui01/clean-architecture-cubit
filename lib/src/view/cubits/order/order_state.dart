import 'package:clean_architecture_cubit/src/domain/models/order.dart';

abstract class OrderState {}

class StateLoading implements OrderState {
  StateLoading();
}

class StateSuccess implements OrderState {
  List<Order> orders;
  StateSuccess(this.orders);
}

class StateFailed implements OrderState {
  StateFailed();
}

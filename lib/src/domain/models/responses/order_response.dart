import '../order.dart';

class OrderResponse {
  final List<Order> orders;

  OrderResponse({
    required this.orders,
  });

  factory OrderResponse.fromMap(Map<String, dynamic> map) {
    return OrderResponse(
      orders: List<Order>.from(map['orders']),
    );
  }

  bool get stringify => true;
}

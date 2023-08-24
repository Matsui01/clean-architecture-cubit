import '../../domain/models/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasource/local/app_database.dart';

class OrdersRepositoryImpl implements OrderRepository {
  final AppDatabase _appDatabase;

  OrdersRepositoryImpl(this._appDatabase);

  @override
  Future<List<Order>> getOrders() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return await _appDatabase.orderDao.getAllOrders();
  }

  @override
  Future<void> removeOrder(Order order) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return await _appDatabase.orderDao.deleteOrder(order);
  }

  @override
  Future<void> saveOrder(Order order) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return await _appDatabase.orderDao.insertOrder(order);
  }
}

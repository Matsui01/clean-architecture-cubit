import 'package:floor/floor.dart';

import '../../../../domain/models/order.dart';
import '../../../../utils/constants/strings.dart';

@dao
abstract class OrderDao {
  @Query('SELECT * FROM $orderTableName')
  Future<List<Order>> getAllOrders();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOrder(Order order);

  @delete
  Future<void> deleteOrder(Order order);
}

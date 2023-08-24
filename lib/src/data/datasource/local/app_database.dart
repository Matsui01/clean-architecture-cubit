import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/models/order.dart';
import 'dao/orders_dao.dart';

part 'app_database.g.dart';

// @TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Order])
abstract class AppDatabase extends FloorDatabase {
  OrderDao get orderDao;
}

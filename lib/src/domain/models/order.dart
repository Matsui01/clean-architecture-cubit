import 'package:floor/floor.dart';

import '../../utils/constants/strings.dart';

@Entity(tableName: orderTableName)
class Order {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? description;

  const Order({
    this.id,
    this.description,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as int : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }
}

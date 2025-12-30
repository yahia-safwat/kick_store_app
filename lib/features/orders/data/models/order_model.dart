import 'package:hive/hive.dart';
import 'package:kick_store_app/features/cart/data/models/cart_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 1)
class OrderModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<CartModel> items;

  @HiveField(2)
  final double totalPrice;

  @HiveField(3)
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.createdAt,
  });
}

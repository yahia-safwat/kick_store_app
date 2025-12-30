import 'package:kick_store_app/features/cart/domain/cart_item.dart';

class OrderEntity {
  final String id;
  final List<CartItem> items;
  final double totalPrice;
  final DateTime createdAt;

  OrderEntity({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.createdAt,
  });
}

import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> getOrders();
  Future<void> placeOrder(OrderEntity order);
}

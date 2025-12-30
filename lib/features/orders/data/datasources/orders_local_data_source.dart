import 'package:hive_flutter/hive_flutter.dart';
import 'package:kick_store_app/features/orders/data/models/order_model.dart';

abstract class OrdersLocalDataSource {
  Future<List<OrderModel>> getOrders();
  Future<void> saveOrder(OrderModel order);
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  static const String boxName = 'orders_box';

  @override
  Future<List<OrderModel>> getOrders() async {
    final box = await Hive.openBox<OrderModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> saveOrder(OrderModel order) async {
    final box = await Hive.openBox<OrderModel>(boxName);
    await box.add(order);
  }
}

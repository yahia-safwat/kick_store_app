import 'package:hive_flutter/hive_flutter.dart';
import 'package:kick_store_app/features/cart/data/models/cart_model.dart';

abstract class CartLocalDataSource {
  Future<List<CartModel>> getCartItems();
  Future<void> saveCartItem(CartModel item);
  Future<void> removeCartItem(String id, int size);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String boxName = 'cart_box';

  @override
  Future<List<CartModel>> getCartItems() async {
    final box = await Hive.openBox<CartModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> saveCartItem(CartModel item) async {
    final box = await Hive.openBox<CartModel>(boxName);
    final key = '${item.id}_${item.selectedSize}';
    await box.put(key, item);
  }

  @override
  Future<void> removeCartItem(String id, int size) async {
    final box = await Hive.openBox<CartModel>(boxName);
    final key = '${id}_$size';
    await box.delete(key);
  }

  @override
  Future<void> clearCart() async {
    final box = await Hive.openBox<CartModel>(boxName);
    await box.clear();
  }
}

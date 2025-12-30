import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(SneakerEntity sneaker, int size);
  Future<void> removeFromCart(String sneakerId, int size);
  Future<void> updateQuantity(String sneakerId, int size, int quantity);
  Future<void> clearCart();
}

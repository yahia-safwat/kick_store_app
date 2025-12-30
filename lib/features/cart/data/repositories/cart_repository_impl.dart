import 'package:kick_store_app/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:kick_store_app/features/cart/data/models/cart_model.dart';
import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl(this.localDataSource);

  @override
  Future<List<CartItem>> getCartItems() async {
    final models = await localDataSource.getCartItems();
    return models
        .map(
          (model) => CartItem(
            sneaker: SneakerEntity(
              id: model.id,
              name: model.name,
              brand: model.brand,
              description: '', // Not strictly needed in cart list
              price: model.price,
              imageUrl: model.imageUrl,
              sizes: [], // Not strictly needed in cart list
            ),
            quantity: model.quantity,
            selectedSize: model.selectedSize,
          ),
        )
        .toList();
  }

  @override
  Future<void> addToCart(SneakerEntity sneaker, int size) async {
    final items = await getCartItems();
    final existingIndex = items.indexWhere(
      (item) => item.sneaker.id == sneaker.id && item.selectedSize == size,
    );

    if (existingIndex != -1) {
      final existingItem = items[existingIndex];
      await localDataSource.saveCartItem(
        CartModel(
          id: sneaker.id,
          name: sneaker.name,
          brand: sneaker.brand,
          price: sneaker.price,
          imageUrl: sneaker.imageUrl,
          quantity: existingItem.quantity + 1,
          selectedSize: size,
        ),
      );
    } else {
      await localDataSource.saveCartItem(
        CartModel(
          id: sneaker.id,
          name: sneaker.name,
          brand: sneaker.brand,
          price: sneaker.price,
          imageUrl: sneaker.imageUrl,
          quantity: 1,
          selectedSize: size,
        ),
      );
    }
  }

  @override
  Future<void> removeFromCart(String sneakerId, int size) async {
    await localDataSource.removeCartItem(sneakerId, size);
  }

  @override
  Future<void> updateQuantity(String sneakerId, int size, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(sneakerId, size);
      return;
    }

    final items = await getCartItems();
    final item = items.firstWhere(
      (i) => i.sneaker.id == sneakerId && i.selectedSize == size,
    );

    await localDataSource.saveCartItem(
      CartModel(
        id: sneakerId,
        name: item.sneaker.name,
        brand: item.sneaker.brand,
        price: item.sneaker.price,
        imageUrl: item.sneaker.imageUrl,
        quantity: quantity,
        selectedSize: size,
      ),
    );
  }

  @override
  Future<void> clearCart() async {
    await localDataSource.clearCart();
  }
}

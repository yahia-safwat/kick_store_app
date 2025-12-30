import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:kick_store_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:kick_store_app/features/cart/domain/usecases/add_to_cart.dart';
import 'package:kick_store_app/features/cart/domain/usecases/clear_cart.dart';
import 'package:kick_store_app/features/cart/domain/usecases/get_cart_items.dart';
import 'package:kick_store_app/features/cart/domain/usecases/remove_from_cart.dart';
import 'package:kick_store_app/features/cart/domain/usecases/update_cart_quantity.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

final cartLocalDataSourceProvider = Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSourceImpl();
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepositoryImpl(localDataSource);
});

// UseCase Providers
final getCartItemsProvider = Provider<GetCartItems>((ref) {
  return GetCartItems(ref.watch(cartRepositoryProvider));
});

final addToCartProvider = Provider<AddToCart>((ref) {
  return AddToCart(ref.watch(cartRepositoryProvider));
});

final removeFromCartProvider = Provider<RemoveFromCart>((ref) {
  return RemoveFromCart(ref.watch(cartRepositoryProvider));
});

final updateCartQuantityProvider = Provider<UpdateCartQuantity>((ref) {
  return UpdateCartQuantity(ref.watch(cartRepositoryProvider));
});

final clearCartProvider = Provider<ClearCart>((ref) {
  return ClearCart(ref.watch(cartRepositoryProvider));
});

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.sneaker.price * item.quantity));
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}

class CartNotifier extends StateNotifier<CartState> {
  final GetCartItems getCartItems;
  final AddToCart addToCart;
  final RemoveFromCart removeFromCart;
  final UpdateCartQuantity updateCartQuantity;
  final ClearCart clearCartUseCase;

  CartNotifier({
    required this.getCartItems,
    required this.addToCart,
    required this.removeFromCart,
    required this.updateCartQuantity,
    required this.clearCartUseCase,
  }) : super(CartState(items: [])) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    final items = await getCartItems(const NoParams());
    state = state.copyWith(items: items);
  }

  Future<void> addItem(SneakerEntity sneaker, int size) async {
    await addToCart(AddToCartParams(sneaker: sneaker, size: size));
    await _loadCart();
  }

  Future<void> removeItem(String id, int size) async {
    await removeFromCart(RemoveFromCartParams(sneakerId: id, size: size));
    await _loadCart();
  }

  Future<void> updateQuantity(String id, int size, int quantity) async {
    await updateCartQuantity(
      UpdateCartQuantityParams(sneakerId: id, size: size, quantity: quantity),
    );
    await _loadCart();
  }

  Future<void> clearCart() async {
    await clearCartUseCase(const NoParams());
    await _loadCart();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(
    getCartItems: ref.watch(getCartItemsProvider),
    addToCart: ref.watch(addToCartProvider),
    removeFromCart: ref.watch(removeFromCartProvider),
    updateCartQuantity: ref.watch(updateCartQuantityProvider),
    clearCartUseCase: ref.watch(clearCartProvider),
  );
});

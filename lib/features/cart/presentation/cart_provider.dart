import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

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
  CartNotifier() : super(CartState(items: []));

  void addItem(SneakerEntity sneaker, int size) {
    final existingIndex = state.items.indexWhere(
      (item) => item.sneaker.id == sneaker.id && item.selectedSize == size,
    );

    if (existingIndex != -1) {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
      state = state.copyWith(items: updatedItems);
    } else {
      state = state.copyWith(
        items: [
          ...state.items,
          CartItem(sneaker: sneaker, quantity: 1, selectedSize: size),
        ],
      );
    }
  }

  void removeItem(String id, int size) {
    state = state.copyWith(
      items: state.items
          .where(
            (item) => !(item.sneaker.id == id && item.selectedSize == size),
          )
          .toList(),
    );
  }

  void updateQuantity(String id, int size, int quantity) {
    if (quantity <= 0) {
      removeItem(id, size);
      return;
    }
    final updatedItems = state.items.map((item) {
      if (item.sneaker.id == id && item.selectedSize == size) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();
    state = state.copyWith(items: updatedItems);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

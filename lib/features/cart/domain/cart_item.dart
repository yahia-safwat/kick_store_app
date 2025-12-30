import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

class CartItem {
  final SneakerEntity sneaker;
  final int quantity;
  final int selectedSize;

  const CartItem({
    required this.sneaker,
    required this.quantity,
    required this.selectedSize,
  });

  CartItem copyWith({
    SneakerEntity? sneaker,
    int? quantity,
    int? selectedSize,
  }) {
    return CartItem(
      sneaker: sneaker ?? this.sneaker,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}

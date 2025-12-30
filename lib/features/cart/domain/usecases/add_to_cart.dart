import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

class AddToCartParams {
  final SneakerEntity sneaker;
  final int size;

  AddToCartParams({required this.sneaker, required this.size});
}

class AddToCart implements UseCase<void, AddToCartParams> {
  final CartRepository repository;

  AddToCart(this.repository);

  @override
  Future<void> call(AddToCartParams params) async {
    return await repository.addToCart(params.sneaker, params.size);
  }
}

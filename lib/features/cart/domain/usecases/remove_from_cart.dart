import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';

class RemoveFromCartParams {
  final String sneakerId;
  final int size;

  RemoveFromCartParams({required this.sneakerId, required this.size});
}

class RemoveFromCart implements UseCase<void, RemoveFromCartParams> {
  final CartRepository repository;

  RemoveFromCart(this.repository);

  @override
  Future<void> call(RemoveFromCartParams params) async {
    return await repository.removeFromCart(params.sneakerId, params.size);
  }
}

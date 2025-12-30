import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartQuantityParams {
  final String sneakerId;
  final int size;
  final int quantity;

  UpdateCartQuantityParams({
    required this.sneakerId,
    required this.size,
    required this.quantity,
  });
}

class UpdateCartQuantity implements UseCase<void, UpdateCartQuantityParams> {
  final CartRepository repository;

  UpdateCartQuantity(this.repository);

  @override
  Future<void> call(UpdateCartQuantityParams params) async {
    return await repository.updateQuantity(
      params.sneakerId,
      params.size,
      params.quantity,
    );
  }
}

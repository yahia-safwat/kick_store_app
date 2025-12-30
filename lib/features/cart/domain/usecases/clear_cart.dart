import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';

class ClearCart implements UseCase<void, NoParams> {
  final CartRepository repository;

  ClearCart(this.repository);

  @override
  Future<void> call(NoParams params) async {
    return await repository.clearCart();
  }
}

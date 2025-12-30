import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/cart/domain/repositories/cart_repository.dart';

class GetCartItems implements UseCase<List<CartItem>, NoParams> {
  final CartRepository repository;

  GetCartItems(this.repository);

  @override
  Future<List<CartItem>> call(NoParams params) async {
    return await repository.getCartItems();
  }
}

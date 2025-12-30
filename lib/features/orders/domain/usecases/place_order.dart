import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';
import 'package:kick_store_app/features/orders/domain/repositories/orders_repository.dart';

class PlaceOrder implements UseCase<void, OrderEntity> {
  final OrdersRepository repository;

  PlaceOrder(this.repository);

  @override
  Future<void> call(OrderEntity params) async {
    return await repository.placeOrder(params);
  }
}

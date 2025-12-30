import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';
import 'package:kick_store_app/features/orders/domain/repositories/orders_repository.dart';

class GetOrderHistory implements UseCase<List<OrderEntity>, NoParams> {
  final OrdersRepository repository;

  GetOrderHistory(this.repository);

  @override
  Future<List<OrderEntity>> call(NoParams params) async {
    return await repository.getOrders();
  }
}

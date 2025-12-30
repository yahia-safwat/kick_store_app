import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/orders/data/datasources/orders_local_data_source.dart';
import 'package:kick_store_app/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';
import 'package:kick_store_app/features/orders/domain/repositories/orders_repository.dart';
import 'package:kick_store_app/features/orders/domain/usecases/get_order_history.dart';
import 'package:kick_store_app/features/orders/domain/usecases/place_order.dart';

final ordersLocalDataSourceProvider = Provider<OrdersLocalDataSource>((ref) {
  return OrdersLocalDataSourceImpl();
});

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  final localDataSource = ref.watch(ordersLocalDataSourceProvider);
  return OrdersRepositoryImpl(localDataSource);
});

final getOrderHistoryProvider = Provider<GetOrderHistory>((ref) {
  return GetOrderHistory(ref.watch(ordersRepositoryProvider));
});

final placeOrderUseCaseProvider = Provider<PlaceOrder>((ref) {
  return PlaceOrder(ref.watch(ordersRepositoryProvider));
});

class OrdersState {
  final List<OrderEntity> orders;
  final bool isLoading;

  OrdersState({required this.orders, this.isLoading = false});

  OrdersState copyWith({List<OrderEntity>? orders, bool? isLoading}) {
    return OrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class OrdersNotifier extends StateNotifier<OrdersState> {
  final GetOrderHistory getOrderHistory;
  final PlaceOrder placeOrderUseCase;

  OrdersNotifier({
    required this.getOrderHistory,
    required this.placeOrderUseCase,
  }) : super(OrdersState(orders: [])) {
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    state = state.copyWith(isLoading: true);
    final orders = await getOrderHistory(const NoParams());
    state = state.copyWith(orders: orders, isLoading: false);
  }

  Future<void> createOrder(OrderEntity order) async {
    await placeOrderUseCase(order);
    await _loadOrders();
  }
}

final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>((
  ref,
) {
  return OrdersNotifier(
    getOrderHistory: ref.watch(getOrderHistoryProvider),
    placeOrderUseCase: ref.watch(placeOrderUseCaseProvider),
  );
});

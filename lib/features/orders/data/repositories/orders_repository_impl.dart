import 'package:kick_store_app/features/cart/data/models/cart_model.dart';
import 'package:kick_store_app/features/cart/domain/cart_item.dart';
import 'package:kick_store_app/features/orders/data/datasources/orders_local_data_source.dart';
import 'package:kick_store_app/features/orders/data/models/order_model.dart';
import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';
import 'package:kick_store_app/features/orders/domain/repositories/orders_repository.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersLocalDataSource localDataSource;

  OrdersRepositoryImpl(this.localDataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
    final models = await localDataSource.getOrders();
    return models
        .map(
          (model) => OrderEntity(
            id: model.id,
            totalPrice: model.totalPrice,
            createdAt: model.createdAt,
            items: model.items
                .map(
                  (itemModel) => CartItem(
                    sneaker: SneakerEntity(
                      id: itemModel.id,
                      name: itemModel.name,
                      brand: itemModel.brand,
                      description: '',
                      price: itemModel.price,
                      imageUrl: itemModel.imageUrl,
                      sizes: [],
                    ),
                    quantity: itemModel.quantity,
                    selectedSize: itemModel.selectedSize,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Future<void> placeOrder(OrderEntity order) async {
    await localDataSource.saveOrder(
      OrderModel(
        id: order.id,
        totalPrice: order.totalPrice,
        createdAt: order.createdAt,
        items: order.items
            .map(
              (item) => CartModel(
                id: item.sneaker.id,
                name: item.sneaker.name,
                brand: item.sneaker.brand,
                price: item.sneaker.price,
                imageUrl: item.sneaker.imageUrl,
                quantity: item.quantity,
                selectedSize: item.selectedSize,
              ),
            )
            .toList(),
      ),
    );
  }
}

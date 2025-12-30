import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

abstract class ProductsRepository {
  Future<List<SneakerEntity>> getProducts();
  Future<SneakerEntity> getProductDetails(String id);
}

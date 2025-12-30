import 'package:kick_store_app/features/products/data/datasources/products_remote_data_source.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';
import 'package:kick_store_app/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<SneakerEntity>> getProducts() async {
    final models = await remoteDataSource.getProducts();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<SneakerEntity> getProductDetails(String id) async {
    final model = await remoteDataSource.getProductDetails(id);
    return model.toEntity();
  }
}

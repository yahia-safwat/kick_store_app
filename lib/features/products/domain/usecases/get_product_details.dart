import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';
import 'package:kick_store_app/features/products/domain/repositories/products_repository.dart';

class GetProductDetails implements UseCase<SneakerEntity, String> {
  final ProductsRepository repository;

  GetProductDetails(this.repository);

  @override
  Future<SneakerEntity> call(String id) async {
    return await repository.getProductDetails(id);
  }
}

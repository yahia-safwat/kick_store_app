import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';
import 'package:kick_store_app/features/products/domain/repositories/products_repository.dart';

class GetProducts implements UseCase<List<SneakerEntity>, NoParams> {
  final ProductsRepository repository;

  GetProducts(this.repository);

  @override
  Future<List<SneakerEntity>> call(NoParams params) async {
    return await repository.getProducts();
  }
}

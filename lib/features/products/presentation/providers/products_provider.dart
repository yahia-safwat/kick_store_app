import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/network/dio_client.dart';
import 'package:kick_store_app/features/products/data/datasources/products_remote_data_source.dart';
import 'package:kick_store_app/features/products/data/repositories/products_repository_impl.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';
import 'package:kick_store_app/features/products/domain/repositories/products_repository.dart';
import 'package:kick_store_app/features/products/domain/usecases/get_products.dart';
import 'package:kick_store_app/features/products/domain/usecases/get_product_details.dart';
import 'package:kick_store_app/core/usecases/usecase.dart';

final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return ProductsRemoteDataSourceImpl(dio);
});

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final remoteDataSource = ref.watch(productsRemoteDataSourceProvider);
  return ProductsRepositoryImpl(remoteDataSource);
});

final getProductsUseCaseProvider = Provider<GetProducts>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetProducts(repository);
});

final getProductDetailsUseCaseProvider = Provider<GetProductDetails>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetProductDetails(repository);
});

final productsProvider = FutureProvider<List<SneakerEntity>>((ref) async {
  final getProducts = ref.watch(getProductsUseCaseProvider);
  return await getProducts(const NoParams());
});

final productDetailsProvider = FutureProvider.family<SneakerEntity, String>((
  ref,
  id,
) async {
  final getProductDetails = ref.watch(getProductDetailsUseCaseProvider);
  return await getProductDetails(id);
});

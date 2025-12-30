import 'package:dio/dio.dart';

import '../models/sneaker_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<SneakerModel>> getProducts();
  Future<SneakerModel> getProductDetails(String id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl(this.dio);

  // Mock data for demonstration
  final List<SneakerModel> _mockSneakerModels = [
    const SneakerModel(
      id: '1',
      name: 'Air Jordan 1 Retro High OG',
      brand: 'Jordan',
      description:
          'The Air Jordan 1 Retro High OG is a high-top SneakerModel with a leather upper and a rubber outsole.',
      price: 180.0,
      imageUrl:
          'https://images.unsplash.com/photo-1602231379593-b85a472e3c99?q=80&w=1000&auto=format&fit=crop',
      sizes: [40, 41, 42, 43, 44, 45],
    ),
    const SneakerModel(
      id: '2',
      name: 'Nike Dunk Low Panda',
      brand: 'Nike',
      description:
          'The Nike Dunk Low Panda is a low-top SneakerModel with a black and white leather upper.',
      price: 110.0,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop',
      sizes: [38, 39, 40, 41, 42],
    ),
    const SneakerModel(
      id: '3',
      name: 'Adidas Yeezy Boost 350 V2',
      brand: 'Adidas',
      description:
          'The Adidas Yeezy Boost 350 V2 is a comfortable lifestyle SneakerModel designed by Kanye West.',
      price: 230.0,
      imageUrl:
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?q=80&w=1000&auto=format&fit=crop',
      sizes: [40, 41, 42, 43, 44],
    ),
    const SneakerModel(
      id: '4',
      name: 'New Balance 550',
      brand: 'New Balance',
      description:
          'The New Balance 550 is a retro basketball SneakerModel with a clean look.',
      price: 120.0,
      imageUrl:
          'https://images.unsplash.com/photo-1539185441755-769473a23570?q=80&w=1000&auto=format&fit=crop',
      sizes: [39, 40, 41, 42, 43],
    ),
  ];

  @override
  Future<List<SneakerModel>> getProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return _mockSneakerModels;
  }

  @override
  Future<SneakerModel> getProductDetails(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockSneakerModels.firstWhere((s) => s.id == id);
  }
}

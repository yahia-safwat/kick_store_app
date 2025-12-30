import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kick_store_app/features/products/domain/entities/sneaker.dart';

part 'sneaker_model.freezed.dart';
part 'sneaker_model.g.dart';

@freezed
class SneakerModel with _$SneakerModel {
  const SneakerModel._();

  const factory SneakerModel({
    required String id,
    required String name,
    required String brand,
    required String description,
    required double price,
    required String imageUrl,
    required List<int> sizes,
    @Default(false) bool isFavorite,
  }) = _SneakerModel;

  factory SneakerModel.fromJson(Map<String, dynamic> json) =>
      _$SneakerModelFromJson(json);

  factory SneakerModel.fromEntity(SneakerEntity entity) {
    return SneakerModel(
      id: entity.id,
      name: entity.name,
      brand: entity.brand,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
      sizes: entity.sizes,
      isFavorite: entity.isFavorite,
    );
  }

  SneakerEntity toEntity() {
    return SneakerEntity(
      id: id,
      name: name,
      brand: brand,
      description: description,
      price: price,
      imageUrl: imageUrl,
      sizes: sizes,
      isFavorite: isFavorite,
    );
  }
}

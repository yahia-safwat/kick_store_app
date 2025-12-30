// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SneakerModelImpl _$$SneakerModelImplFromJson(Map<String, dynamic> json) =>
    _$SneakerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$SneakerModelImplToJson(_$SneakerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'sizes': instance.sizes,
      'isFavorite': instance.isFavorite,
    };

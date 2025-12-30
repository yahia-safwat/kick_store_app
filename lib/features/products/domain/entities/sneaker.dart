class SneakerEntity {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final List<int> sizes;
  final bool isFavorite;

  const SneakerEntity({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    this.isFavorite = false,
  });
}

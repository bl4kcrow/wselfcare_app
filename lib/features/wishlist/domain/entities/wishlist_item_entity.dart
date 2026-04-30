class WishlistItemEntity {
  final String id;
  final String brand;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isAvailable;

  const WishlistItemEntity({
    required this.id,
    required this.brand,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
  });
}

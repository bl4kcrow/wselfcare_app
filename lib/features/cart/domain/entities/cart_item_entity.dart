class CartItemEntity {
  final String id;
  final String brand;
  final String title;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  const CartItemEntity({
    required this.id,
    required this.brand,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

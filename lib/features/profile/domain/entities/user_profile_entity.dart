class UserProfileEntity {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final int ordersCount;
  final int favoritesCount;
  final int reviewsCount;

  const UserProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.ordersCount,
    required this.favoritesCount,
    required this.reviewsCount,
  });
}

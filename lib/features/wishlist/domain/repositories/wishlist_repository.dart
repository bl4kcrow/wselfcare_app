import '../entities/wishlist_item_entity.dart';

abstract class WishlistRepository {
  Future<List<WishlistItemEntity>> getWishlistItems();
}

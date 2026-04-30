import '../entities/cart_item_entity.dart';
import '../entities/cart_summary_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCartItems();
  Future<CartSummaryEntity> getCartSummary();
}

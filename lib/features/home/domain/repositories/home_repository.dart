import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../entities/campaign_entity.dart';

abstract class HomeRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getBestSellers();
  Future<CampaignEntity> getLimitedEditionCampaign();
}

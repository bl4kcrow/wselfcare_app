import '../../domain/entities/wishlist_item_entity.dart';
import '../../domain/repositories/wishlist_repository.dart';

class MockWishlistRepositoryImpl implements WishlistRepository {
  @override
  Future<List<WishlistItemEntity>> getWishlistItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const WishlistItemEntity(
        id: '1',
        brand: 'Lumina',
        title: 'Rose Quartz Facial Roller',
        description: 'Enhance your skin\'s elasticity and promote a radiant glow with our authentic rose quartz roller.',
        price: 28.00,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDQqR6k1t4gP2k3u-9n5Z0U4m8m8e8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n8Rj0GkLqZ4y6t2W0y8n',
        isAvailable: true,
      ),
      const WishlistItemEntity(
        id: '2',
        brand: 'Aura Botanicals',
        title: 'Calming Lavender Mist',
        description: 'A soothing facial mist formulated with organic lavender water to hydrate and refresh your skin anytime.',
        price: 18.50,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAegUT8pg3pCMm4sR1X7Q2LMbsfYtnTWPFOxFCGB8F-G5btrLGHkbbu1GyJlPwhMkP8jrpqwkLaYiFa4ZQYVg0iep_m16dAB0jqLlfuHs6s7Y39UAyboEJXORYuY7Yby6rlenC_L81aZ620bB8MRrLEpabPON__ChCUe8pMqvH6axb8WkhQ6HyNpFNzEtzzPR8VBG_S4MPLrjC2ju-yDuEfhWobePT-HIsS2JRsDU-9Z_gIkJKJTYFxPczm6XdZKFK4BPD_QuCGrrc',
        isAvailable: false,
      ),
      const WishlistItemEntity(
        id: '3',
        brand: 'Essence',
        title: 'Nourishing Hair Serum',
        description: 'A lightweight serum that smooths frizz, protects against heat, and adds brilliant shine to all hair types.',
        price: 32.00,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCgbPQRMiJpGrgu9blNHvXpCkRNkZI83TFkuf-nLlT3fEGJMH7_zDLYmZWT3qLAOFzINc3AnKVeE71AOTjb7B6ROZUWCIbuaOmzaykq1A9uqkqoEwoQYpNLKGTeEWSnwbDP1tWHZ5KJVoJgEM50hj7m1UH9YfyG8kH9vHGoSwzzgtsq-g1h98jpr8lyDOwiba2vh_9_zVbwPZSpyh2EDpirq2VwQ1N9wkyt78kqkBcQXTeJ-eZbVNHsvQwRy7FDqrdwquwlDcUW7nU',
        isAvailable: true,
      ),
    ];
  }
}

import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/cart_summary_entity.dart';
import '../../domain/repositories/cart_repository.dart';

class MockCartRepositoryImpl implements CartRepository {
  @override
  Future<List<CartItemEntity>> getCartItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const CartItemEntity(
        id: '1',
        brand: 'Botany & Bloom',
        title: 'Velvet Rose Elixir',
        description: '30ml of pure botanical radiance for your evening glow.',
        price: 72.00,
        quantity: 1,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAegUT8pg3pCMm4sR1X7Q2LMbsfYtnTWPFOxFCGB8F-G5btrLGHkbbu1GyJlPwhMkP8jrpqwkLaYiFa4ZQYVg0iep_m16dAB0jqLlfuHs6s7Y39UAyboEJXORYuY7Yby6rlenC_L81aZ620bB8MRrLEpabPON__ChCUe8pMqvH6axb8WkhQ6HyNpFNzEtzzPR8VBG_S4MPLrjC2ju-yDuEfhWobePT-HIsS2JRsDU-9Z_gIkJKJTYFxPczm6XdZKFK4BPD_QuCGrrc',
      ),
      const CartItemEntity(
        id: '2',
        brand: 'Studio Serene',
        title: 'Golden Hour Ember',
        description: 'Hand-poured soy candle with notes of cedar and honey.',
        price: 48.00,
        quantity: 2,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCgbPQRMiJpGrgu9blNHvXpCkRNkZI83TFkuf-nLlT3fEGJMH7_zDLYmZWT3qLAOFzINc3AnKVeE71AOTjb7B6ROZUWCIbuaOmzaykq1A9uqkqoEwoQYpNLKGTeEWSnwbDP1tWHZ5KJVoJgEM50hj7m1UH9YfyG8kH9vHGoSwzzgtsq-g1h98jpr8lyDOwiba2vh_9_zVbwPZSpyh2EDpirq2VwQ1N9wkyt78kqkBcQXTeJ-eZbVNHsvQwRy7FDqrdwquwlDcUW7nU',
      ),
      const CartItemEntity(
        id: '3',
        brand: 'Loom & Lace',
        title: 'Silk Dream Mask',
        description: 'Premium mulberry silk for the ultimate beauty sleep.',
        price: 35.00,
        quantity: 1,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCAh3YYzzkVVRizCd2WHFBX5vHmUcGoeczXdFNEN_xj5etfUVPJhzK1HwN8Oesn80BS3PLMF8LQK49Rx3ZuK4w9oDUprZHdEYp0fAptPnoPjZi_BBLXGSuVt8oxTaINBTquS3VdVzwww8i9lFCX08WsFpn4_0WMPgXLlkMD9j-JyfVtHqb4kW1WybOipD0bczqLOppJolEHguvFMIDzWmNVziSWyJaztoEibAtdK_R-Sg_XvDpibX9hBSxecgVIPjf3zw7KLcJl2MQ',
      ),
    ];
  }

  @override
  Future<CartSummaryEntity> getCartSummary() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const CartSummaryEntity(
      subtotal: 203.00,
      shipping: 0.0,
      total: 203.00,
      isShippingCalculated: false,
    );
  }
}

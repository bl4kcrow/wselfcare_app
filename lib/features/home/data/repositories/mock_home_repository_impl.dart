import 'package:flutter/material.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/repositories/home_repository.dart';

class MockHomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const CategoryEntity(id: '1', name: 'Skincare', iconData: Icons.spa),
      const CategoryEntity(id: '2', name: 'Wellness', iconData: Icons.self_improvement),
      const CategoryEntity(id: '3', name: 'Fragrance', iconData: Icons.air),
      const CategoryEntity(id: '4', name: 'Beauty', iconData: Icons.face_3),
      const CategoryEntity(id: '5', name: 'Body', iconData: Icons.sanitizer),
    ];
  }

  @override
  Future<List<ProductEntity>> getBestSellers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const ProductEntity(
        id: '1',
        title: 'Radiance Elixir',
        subtitle: 'Aromatic Facial Oil',
        price: '\$74',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCB0HWVacHPZNBd0suOff9KHlENoab4VCNwSCK_nGMssqoX3Fd31xf-Ki3HxtbE4fZfyiVHIq-f7Rpw7Sv1S4IIIyXDtA2LjS000GSoC0KweyIn-h9AmoK-05Gw7nd1efetWWeFvBg3zUeXLWQ3azX3SymZsbQsFPiJRvVXELMkbM10y4RmIFZ_nCYuJjsrRE6RF83zRid27Zsj6m-JKzsQg-esiephF0Iyvo5cmBvhw2QcabCsOC1Is7HqRqIyQfDDl2hW_XO4Nko',
      ),
      const ProductEntity(
        id: '2',
        title: 'Twilight Bloom',
        subtitle: 'Soy Wax Candle',
        price: '\$42',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD-qpl9ywIc07w_knxQoBO5sjRqYzF8z0NpOpZILOR_PzfW_hN82T-Ve7e06qqgSckLDtf8BWGhcsdVOldKLMmqQzcm8sDuqbgwF_Yg5Cvdy_ab6q43XPNoXWgKVVfgnWJghfoPEVIcSHoTahtoA9ndHtPiDux2nXgs3RvXTef1rmUgV_hIVHfugYYMMLdCIzDvAxZkZjTW3gV2S4a32NBpW5o9TF-rklAhZmhbw2qxZtTSvgbs6lpnSFAigVhqRivxbXSAPiXM2is',
      ),
      const ProductEntity(
        id: '3',
        title: 'The Muse Kit',
        subtitle: 'Luxury Travel Set',
        price: '\$120',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDDyWaOHgHjvj2VCt-kaGP2lrER6gT0N9SB3ivuB64q-IbztcZjg4CbNlN6r5sZAiDBo2GeMf-GIHLNOekkVxcMA-S6UZVMy1H9KGf01oil7dOSrTx1phWDynurIKu84uU9SRVzZoszTLb4sUtRl4IO5_aGWAtXMSR0zS_B12RO0TCxSkRJIETI6PeOdtzSlO4pC_pJkZM3DDNTLCDxIhdGz-mrI0mp4Cygk_RSPkfITn8_hWnks1OUzLvpJ8IPB9U7WIhDGDczOY8',
      ),
    ];
  }

  @override
  Future<CampaignEntity> getLimitedEditionCampaign() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const CampaignEntity(
      id: '1',
      title: 'The Glow Collective',
      subtitle: 'Celebrate You',
      description: 'Curated by women, for women. Elevate your ritual with our exclusive IWD collection.\n\nThree award-winning serums designed to unlock your natural radiance.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2hK_QdFedIQ_lL-H395QxTB6IIv6yAvQtMl8PbUCp6OiqTvSHMfJAEeq158X59dAU3aTCYdrGca5kz0A1K3vhaQJ5r0AVCASFoMGo4RhMvwz9-UCW0f2s4ZlUWsx0ooYqVBA6HaLAfkVu-OSXcJtWMZ5oElycajEenDQZiyW_VoI9-3wvoi76b4g3aeWBQLLPmqqV6Flqscy872obPiaKwd0UdmOl-UEx-bGOUEe1zZR3FO-5dnHxkt-WqQ6c4emjHwy8Murpijg',
    );
  }
}

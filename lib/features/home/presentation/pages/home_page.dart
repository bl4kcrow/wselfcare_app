import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../bloc/home_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('WSelfCare'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(LoadHomeData());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: state.categories.map((cat) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: _buildCategoryItem(cat.iconData, cat.name, colorScheme),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Best Sellers Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Best Sellers', style: theme.textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
                            Text('Beloved by our community', style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF464554))),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('VIEW ALL', style: TextStyle(fontSize: 12, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  
                  // Best Sellers Carousel
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      children: state.bestSellers.map((product) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: _buildProductCard(
                            title: product.title,
                            subtitle: product.subtitle,
                            price: product.price,
                            imageUrl: product.imageUrl,
                            theme: theme,
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Limited Edition Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LIMITED EDITION', style: TextStyle(color: colorScheme.secondary, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 10)),
                        Text(state.campaign.subtitle, style: theme.textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
                        const SizedBox(height: 8),
                        Text(state.campaign.description, style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF464554))),
                        const SizedBox(height: 24),
                        // Large Highlight Card
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(state.campaign.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
                              gradient: LinearGradient(
                                colors: [colorScheme.primary.withOpacity(0.8), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.campaign.title, style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontStyle: FontStyle.italic)),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.secondary,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward, size: 16),
                                  label: const Text('SHOP THE COLLECTION', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Newsletter Section
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1EB),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.auto_awesome, color: colorScheme.secondary, size: 40),
                        const SizedBox(height: 16),
                        Text(
                          '"Self-care is not a luxury, it is a deliberate act of choosing oneself."',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(color: colorScheme.primary, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'JOIN THE RADIANT CIRCLE',
                            hintStyle: const TextStyle(fontSize: 12, letterSpacing: 1.5, color: Colors.grey),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () {},
                            child: const Text('SUBSCRIBE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80), // Offset for bottom nav
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFE2D5), // surface-container-high
          ),
          child: Icon(icon, color: colorScheme.primary, size: 32),
        ),
        const SizedBox(height: 8),
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Color(0xFF464554))),
      ],
    );
  }

  Widget _buildProductCard({required String title, required String subtitle, required String price, required String imageUrl, required ThemeData theme}) {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: theme.colorScheme.primary),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF464554))),
              Text(price, style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

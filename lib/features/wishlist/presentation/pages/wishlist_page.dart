import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/wishlist_bloc.dart';
import '../bloc/wishlist_state.dart';
import '../bloc/wishlist_event.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

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
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistInitial) {
            context.read<WishlistBloc>().add(LoadWishlistData());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WishlistError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is WishlistLoaded) {
            final items = state.items;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Wishlist', style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
                    const SizedBox(height: 8),
                    Text('A curated collection of your future rituals.', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 32),

                    if (items.isNotEmpty)
                      _buildWishlistItem(
                        context,
                        category: items[0].brand,
                        title: items[0].title,
                        price: '\$${items[0].price.toStringAsFixed(2)}',
                        imageUrl: items[0].imageUrl,
                        isFeatured: true,
                      ),
                    const SizedBox(height: 24),
                    
                    if (items.length > 1)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Expanded(
                             child: _buildWishlistItem(
                                context,
                                category: items[1].brand,
                                title: items[1].title,
                                price: '\$${items[1].price.toStringAsFixed(2)}',
                                imageUrl: items[1].imageUrl,
                              ),
                           ),
                           const SizedBox(width: 16),
                           if (items.length > 2)
                             Expanded(
                               child: _buildWishlistItem(
                                  context,
                                  category: items[2].brand,
                                  title: items[2].title,
                                  price: '\$${items[2].price.toStringAsFixed(2)}',
                                  imageUrl: items[2].imageUrl,
                                ),
                             )
                           else
                             const Spacer(),
                        ],
                      ),
                    
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildWishlistItem(BuildContext context, {required String category, required String title, required String price, required String imageUrl, bool isFeatured = false}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final double imgHeight = isFeatured ? 350 : 180;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: imgHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.8)),
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.toUpperCase(), style: TextStyle(color: colorScheme.secondary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
                const SizedBox(height: 4),
                Text(title, style: theme.textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 2),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: theme.textTheme.titleMedium?.copyWith(color: colorScheme.primaryContainer, fontStyle: FontStyle.italic)),
                    if (isFeatured)
                      Container(
                        decoration: BoxDecoration(color: colorScheme.primaryContainer, shape: BoxShape.circle),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.shopping_bag, color: Colors.white, size: 20),
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

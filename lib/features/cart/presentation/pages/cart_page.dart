import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import '../bloc/cart_event.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
        title: const Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            context.read<CartBloc>().add(LoadCartData());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is CartLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Selection', style: theme.textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
                  const SizedBox(height: 8),
                  Text('Curated pieces for your daily ritual of self-love.', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 32),

                  ...state.items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: _buildCartItem(
                        context,
                        brand: item.brand,
                        title: item.title,
                        description: item.description,
                        price: '\$${item.price.toStringAsFixed(2)}',
                        qty: item.quantity,
                        imageUrl: item.imageUrl,
                      ),
                    );
                  }),
                  
                  const SizedBox(height: 24),

                  // Order Summary
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1EB),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Summary', style: theme.textTheme.headlineSmall?.copyWith(fontStyle: FontStyle.italic)),
                        const Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                            Text('\$${state.summary.subtotal.toStringAsFixed(2)}', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shipping', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                            Text(state.summary.isShippingCalculated ? '\$${state.summary.shipping.toStringAsFixed(2)}' : 'Calculated at checkout', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Price', style: theme.textTheme.titleMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold)),
                            Text('\$${state.summary.total.toStringAsFixed(2)}', style: theme.textTheme.headlineSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                      ),
                      onPressed: () {},
                      icon: const Text('PLACE ORDER', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      label: const Icon(Icons.arrow_forward),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified_user, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Secure checkout powered by Radiant Pay', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, {required String brand, required String title, required String description, required String price, required int qty, required String imageUrl}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(brand.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorScheme.secondary, letterSpacing: 1.5)),
                  GestureDetector(
                    child: const Icon(Icons.close, size: 20, color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(title, style: theme.textTheme.titleLarge?.copyWith(fontSize: 18, fontStyle: FontStyle.italic)),
              const SizedBox(height: 4),
              Text(description, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.remove, size: 16, color: colorScheme.primary),
                        const SizedBox(width: 16),
                        Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 16),
                        Icon(Icons.add, size: 16, color: colorScheme.primary),
                      ],
                    ),
                  ),
                  Text(price, style: theme.textTheme.titleLarge?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

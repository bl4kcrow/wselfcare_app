import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/data/repositories/mock_home_repository_impl.dart';
import '../../features/wishlist/presentation/pages/wishlist_page.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../features/wishlist/data/repositories/mock_wishlist_repository_impl.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/cart/data/repositories/mock_cart_repository_impl.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/profile/data/repositories/mock_profile_repository_impl.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _calculateSelectedIndex(state.uri.toString()),
            onTap: (int idx) => _onItemTapped(idx, context),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => BlocProvider(
            create: (context) => HomeBloc(repository: MockHomeRepositoryImpl()),
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/wishlist',
          builder: (context, state) => BlocProvider(
            create: (context) => WishlistBloc(repository: MockWishlistRepositoryImpl()),
            child: const WishlistPage(),
          ),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => BlocProvider(
            create: (context) => CartBloc(repository: MockCartRepositoryImpl()),
            child: const CartPage(),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => BlocProvider(
            create: (context) => ProfileBloc(repository: MockProfileRepositoryImpl()),
            child: const ProfilePage(),
          ),
        ),
      ],
    ),
  ],
);

int _calculateSelectedIndex(String location) {
  if (location.startsWith('/home')) return 0;
  if (location.startsWith('/wishlist')) return 1;
  if (location.startsWith('/cart')) return 2;
  if (location.startsWith('/profile')) return 3;
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      context.go('/home');
      break;
    case 1:
      context.go('/wishlist');
      break;
    case 2:
      context.go('/cart');
      break;
    case 3:
      context.go('/profile');
      break;
  }
}

import 'package:go_router/go_router.dart';
import 'package:kick_store_app/features/products/presentation/pages/product_listing_page.dart';
import 'package:kick_store_app/features/products/presentation/pages/product_details_page.dart';
import 'package:kick_store_app/features/cart/presentation/cart_page.dart';
import 'package:kick_store_app/features/favorites/presentation/favorites_page.dart';
import 'package:kick_store_app/features/orders/presentation/order_summary_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const ProductListingPage()),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductDetailsPage(productId: id);
      },
    ),
    GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesPage(),
    ),
    GoRoute(
      path: '/order-summary',
      builder: (context, state) => const OrderSummaryPage(),
    ),
  ],
);

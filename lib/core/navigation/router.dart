import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kick_store_app/core/navigation/main_wrapper.dart';
import 'package:kick_store_app/features/products/presentation/pages/product_listing_page.dart';
import 'package:kick_store_app/features/products/presentation/pages/product_details_page.dart';
import 'package:kick_store_app/features/cart/presentation/cart_page.dart';
import 'package:kick_store_app/features/favorites/presentation/favorites_page.dart';
import 'package:kick_store_app/features/orders/presentation/order_summary_page.dart';
import 'package:kick_store_app/features/orders/presentation/order_history_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _shellNavigatorFavoritesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFavorites');
final GlobalKey<NavigatorState> _shellNavigatorCartKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCart');
final GlobalKey<NavigatorState> _shellNavigatorOrdersKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellOrders');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const ProductListingPage(),
              routes: [
                GoRoute(
                  path: 'details/:id',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return ProductDetailsPage(productId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavoritesKey,
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCartKey,
          routes: [
            GoRoute(
              path: '/cart',
              builder: (context, state) => const CartPage(),
              routes: [
                GoRoute(
                  path: 'summary',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const OrderSummaryPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorOrdersKey,
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => const OrderHistoryPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

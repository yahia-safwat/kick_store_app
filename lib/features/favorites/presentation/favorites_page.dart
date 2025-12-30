import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/widgets/async_value_widget.dart';
import 'package:kick_store_app/features/products/presentation/providers/products_provider.dart';
import 'package:kick_store_app/features/products/presentation/widgets/product_card.dart';
import 'package:kick_store_app/features/favorites/presentation/favorites_provider.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final favoriteIds = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: AsyncValueWidget(
        value: productsAsync,
        data: (products) {
          final favorites = products
              .where((p) => favoriteIds.contains(p.id))
              .toList();

          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final sneaker = favorites[index];
              return ProductCard(
                sneaker: sneaker,
                onTap: () => context.push('/details/${sneaker.id}'),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/widgets/async_value_widget.dart';
import 'package:kick_store_app/features/products/presentation/providers/products_provider.dart';
import 'package:kick_store_app/features/products/presentation/widgets/product_card.dart';

import 'package:go_router/go_router.dart';

class ProductListingPage extends ConsumerWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('KICK STORE')),
      body: AsyncValueWidget(
        value: productsAsync,
        data: (products) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final sneaker = products[index];
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

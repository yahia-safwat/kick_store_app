import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kick_store_app/features/cart/presentation/cart_provider.dart';
import 'package:kick_store_app/features/orders/domain/entities/order_entity.dart';
import 'package:kick_store_app/features/orders/presentation/orders_provider.dart';
import 'package:go_router/go_router.dart';

class OrderSummaryPage extends ConsumerWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    // Create order entity if cart is not empty (for display)
    final order = OrderEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: cartState.items,
      totalPrice: cartState.totalPrice,
      createdAt: DateTime.now(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Order Summary')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'ORDER PREVIEW',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Date: ${dateFormat.format(order.createdAt)}',
                style: const TextStyle(color: Colors.grey),
              ),
              const Divider(height: 40),
              const Text(
                'ITEMS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 16),
              ...cartState.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${item.quantity}x ${item.sneaker.name} (Size: ${item.selectedSize})',
                        ),
                      ),
                      Text(
                        currencyFormat.format(
                          item.sneaker.price * item.quantity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TOTAL',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currencyFormat.format(order.totalPrice),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: cartState.items.isEmpty
                    ? null
                    : () async {
                        await ref
                            .read(ordersProvider.notifier)
                            .createOrder(order);
                        ref.read(cartProvider.notifier).clearCart();

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed successfully!'),
                            ),
                          );
                          context.go('/');
                        }
                      },
                child: const Text('CONFIRM PURCHASE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kick_store_app/features/orders/presentation/orders_provider.dart';

class OrderHistoryPage extends ConsumerWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersProvider);
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final dateFormat = DateFormat('MMM dd, yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: ordersState.orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No orders yet',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ordersState.orders.length,
              itemBuilder: (context, index) {
                final order = ordersState.orders[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ExpansionTile(
                    title: Text(
                      'Order #${order.id.substring(order.id.length - 6)}',
                    ),
                    subtitle: Text(dateFormat.format(order.createdAt)),
                    trailing: Text(
                      currencyFormat.format(order.totalPrice),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    children: order.items
                        .map(
                          (item) => ListTile(
                            title: Text(item.sneaker.name),
                            subtitle: Text(
                              'Size: ${item.selectedSize} x ${item.quantity}',
                            ),
                            trailing: Text(
                              currencyFormat.format(
                                item.sneaker.price * item.quantity,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
    );
  }
}

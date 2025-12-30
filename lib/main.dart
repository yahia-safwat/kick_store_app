import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kick_store_app/app.dart';
import 'package:kick_store_app/features/cart/data/models/cart_model.dart';
import 'package:kick_store_app/features/orders/data/models/order_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  runApp(const ProviderScope(child: KickStoreApp()));
}

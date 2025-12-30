import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kick_store_app/app.dart';
import 'package:kick_store_app/features/cart/data/models/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(CartModelAdapter());

  // Run App
  runApp(const ProviderScope(child: KickStoreApp()));
}

import 'package:flutter/material.dart';
import 'package:kick_store_app/core/theme/app_theme.dart';
import 'package:kick_store_app/core/navigation/router.dart';

class KickStoreApp extends StatelessWidget {
  const KickStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kick Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}

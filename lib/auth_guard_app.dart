import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGuardApp extends StatelessWidget {
  const AuthGuardApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router_auth_guard_example/auth_guard_app.dart';
import 'package:go_router_auth_guard_example/auth_guard_router.dart';

void main() {
  final router = AuthGuardRouter();

  runApp(AuthGuardApp(router: router));
}

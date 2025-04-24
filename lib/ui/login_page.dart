import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/data/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService().login();
            context.pop();
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

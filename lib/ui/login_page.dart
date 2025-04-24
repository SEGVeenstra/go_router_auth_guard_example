import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/data/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.redirect});

  final String? redirect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService().login();
            if (redirect != null) {
              context.go(redirect!);
            } else {
              context.pop();
            }
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/data/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            AuthService().logout();
            context.pop();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}

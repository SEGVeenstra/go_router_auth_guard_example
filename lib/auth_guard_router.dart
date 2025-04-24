import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/ui/detail_page.dart';
import 'package:go_router_auth_guard_example/ui/list_page.dart';
import 'package:go_router_auth_guard_example/ui/login_page.dart';
import 'package:go_router_auth_guard_example/ui/profile_page.dart';

class AuthGuardRouter extends GoRouter {
  AuthGuardRouter()
    : super.routingConfig(
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );

  void goToDetailPage(String articleId) {
    go('/$articleId');
  }

  void goToProfilePage() {
    go('/profile');
  }

  void goToLoginPage() {
    go('/login');
  }

  static AuthGuardRouter of(BuildContext context) {
    return GoRouter.of(context) as AuthGuardRouter;
  }
}

extension AuthGuardRouterExt on BuildContext {
  AuthGuardRouter get authGuardRouter => AuthGuardRouter.of(this);
}

final _routes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => ListPage(),
    routes: [
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return ProfilePage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: '/:articleId',
        builder: (context, state) {
          final articleId = state.pathParameters['articleId']!;
          return DetailPage(articleId: articleId);
        },
      ),
    ],
  ),
];

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/data/auth_service.dart';
import 'package:go_router_auth_guard_example/ui/detail_page.dart';
import 'package:go_router_auth_guard_example/ui/list_page.dart';
import 'package:go_router_auth_guard_example/ui/login_page.dart';
import 'package:go_router_auth_guard_example/ui/profile_page.dart';

class AuthGuardRouter extends GoRouter {
  AuthGuardRouter()
    : super.routingConfig(
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );

  void goToDetailPage(String articleId, {bool isPremium = false}) {
    if (isPremium) {
      go('/premium/$articleId');
    } else {
      go('/$articleId');
    }
  }

  void goToProfilePage() {
    go('/profile');
  }

  void goToLoginPage({String? redirect}) {
    if (redirect != null) {
      go('/login?redirect=$redirect');
    } else {
      go('/login');
    }
  }

  static AuthGuardRouter of(BuildContext context) {
    return GoRouter.of(context) as AuthGuardRouter;
  }
}

extension AuthGuardRouterExt on BuildContext {
  AuthGuardRouter get authGuardRouter => AuthGuardRouter.of(this);
}

String? _authGuard(BuildContext context, GoRouterState state) {
  final isLoggedIn = AuthService().isAuthenticated;

  if (isLoggedIn) return null;

  return '/login?redirect=${state.uri}';
}

final _routes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => ListPage(),
    routes: [
      GoRoute(
        path: '/profile',
        redirect: _authGuard,
        builder: (context, state) {
          return ProfilePage();
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder:
            (context, state) => SlideUpTransitionPage(
              key: state.pageKey,
              child: LoginPage(redirect: state.uri.queryParameters['redirect']),
            ),
      ),
      GoRoute(
        path: '/premium/:articleId',
        redirect: _authGuard,
        builder: (context, state) {
          final articleId = state.pathParameters['articleId']!;
          return DetailPage(articleId: articleId);
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

class SlideUpTransitionPage extends CustomTransitionPage {
  SlideUpTransitionPage({
    required super.child,
    required super.key,
    super.transitionDuration = const Duration(milliseconds: 300),
  }) : super(
         transitionsBuilder:
             (context, animation, secondaryAnimation, child) => SlideTransition(
               position: Tween<Offset>(
                 begin: const Offset(0.0, 1.0),
                 end: Offset.zero,
               ).animate(animation),
               child: child,
             ),
       );
}

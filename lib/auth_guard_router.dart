import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_auth_guard_example/ui/list_page.dart';

class AuthGuardRouter extends GoRouter {
  AuthGuardRouter()
    : super.routingConfig(
        routingConfig: ValueNotifier(RoutingConfig(routes: _routes)),
      );
}

final _routes = <RouteBase>[
  GoRoute(path: '/', builder: (context, state) => ListPage()),
];

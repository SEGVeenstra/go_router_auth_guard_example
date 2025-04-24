import 'package:flutter/material.dart';
import 'package:go_router_auth_guard_example/auth_guard_router.dart';
import 'package:go_router_auth_guard_example/data/articles_repository.dart';
import 'package:go_router_auth_guard_example/data/auth_service.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
        actions: [
          ListenableBuilder(
            listenable: AuthService(),
            builder:
                (context, _) =>
                    AuthService().isAuthenticated
                        ? IconButton(
                          onPressed: context.authGuardRouter.goToProfilePage,
                          icon: Icon(Icons.person),
                        )
                        : TextButton(
                          onPressed: context.authGuardRouter.goToLoginPage,
                          child: Text('Login'),
                        ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ArticlesRepository().articles.length,
          itemBuilder: (context, index) {
            final article = ArticlesRepository().articles[index];
            return ListTile(
              leading: Icon(article.isPremium ? Icons.star : Icons.article),
              title: Text('Article ${article.id}'),
              subtitle: article.isPremium ? Text('Premium') : null,
              onTap:
                  () => context.authGuardRouter.goToDetailPage(
                    article.id,
                    isPremium: article.isPremium,
                  ),
            );
          },
        ),
      ),
    );
  }
}

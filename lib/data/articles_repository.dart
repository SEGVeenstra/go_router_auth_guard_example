class ArticlesRepository {
  static final ArticlesRepository _instance = ArticlesRepository._();

  ArticlesRepository._();
  factory ArticlesRepository() => _instance;

  final List<Article> articles = [
    Article(id: '1', isPremium: false),
    Article(id: '2', isPremium: true),
    Article(id: '3', isPremium: false),
    Article(id: '4', isPremium: true),
  ];
}

class Article {
  Article({required this.id, required this.isPremium});

  final String id;
  final bool isPremium;
}

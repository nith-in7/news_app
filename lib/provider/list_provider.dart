import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/news_article.dart';

class BreakingNewsNotifier extends StateNotifier<List<NewsArticle>> {
  BreakingNewsNotifier() : super([]);

  void addBreakingNews(NewsArticle news) {
    state = [...state, news];
  }
}

final breakingNewsProvider =
    StateNotifierProvider<BreakingNewsNotifier, List<NewsArticle>>(
        (ref) => BreakingNewsNotifier());



class TrendingNewsNotifier extends StateNotifier<List<NewsArticle>> {
  TrendingNewsNotifier() : super([]);

  void addBreakingNews(NewsArticle news) {
    state = [...state, news];
  }
}

final trendingNewsProvider =
    StateNotifierProvider<TrendingNewsNotifier, List<NewsArticle>>(
        (ref) => TrendingNewsNotifier());

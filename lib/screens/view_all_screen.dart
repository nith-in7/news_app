import 'package:flutter/material.dart';
import 'package:news_app/model/news_article.dart';
import 'package:news_app/widgets/trending_view_widget.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key, required this.articles, required this.title});
  final List<NewsArticle> articles;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => getCard(context, articles[index])),
    );
  }
}

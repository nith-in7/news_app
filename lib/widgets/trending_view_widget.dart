import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/category_model.dart';

import 'package:news_app/model/news_article.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/provider/list_provider.dart';
import 'package:news_app/screens/web_view_screen.dart';

class TrendingView extends ConsumerWidget {
  const TrendingView(
      {super.key,
      required this.type,
      required this.customScroll,
      required this.title});
  final String title;
  final NewsTypes type;
  final bool customScroll;

  Future getArticle(WidgetRef ref) async {
    final newsProvider = ref.watch(trendingNewsProvider.notifier);
    final List<NewsArticle> newsList = [];
    final uri = Uri.parse(api[type]!);
    final http.Response response = await http.get(uri);
    final body = jsonDecode(response.body);

    final articles = body["articles"];
    for (final art in articles) {
      if (art["description"] != null &&
          art["title"] != null &&
          art["url"] != null &&
          art["urlToImage"] != null) {
        final newArticle = NewsArticle(
            description: art["description"..toString()],
            title: art["title"]..toString(),
            url: art["url"]..toString(),
            urlToImage: art["urlToImage"].toString());
        customScroll
            ? newsProvider.addBreakingNews(newArticle)
            : newsList.add(newArticle);
      }
    }
    return customScroll ? ref.read(trendingNewsProvider) : newsList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = FutureBuilder(
      future: getArticle(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return customScroll
                ? SliverToBoxAdapter(
                    child: Center(child: Text("${snapshot.error}")))
                : Center(child: Text("${snapshot.error}"));
          }
          if (snapshot.hasData) {
            return customScroll
                ? SliverList.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        getCard(context, snapshot.data[index]))
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        getCard(context, snapshot.data[index]));
          }
        }
        return customScroll
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : const Center(
              child: CircularProgressIndicator(),
            );
      },
    );
    return customScroll
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: content,
          );
  }
}

Widget getCard(context, NewsArticle article) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: article.url),
          ));
    },
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.urlToImage!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
            Expanded(
              child: ListTile(
                title: Text(
                  maxLines: 2,
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 19),
                ),
                subtitle: Text(
                  article.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

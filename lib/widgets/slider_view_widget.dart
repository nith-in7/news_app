import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_article.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/provider/list_provider.dart';
import 'package:news_app/screens/web_view_screen.dart';

class SliderView extends ConsumerStatefulWidget {
  const SliderView({super.key});

  @override
  ConsumerState<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends ConsumerState<SliderView> {
  Future getaBreakibgNews() async {
    final breakingNew = ref.watch(breakingNewsProvider.notifier);
    final uri = Uri.parse(api[NewsTypes.brekingNews]!);
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
        breakingNew.addBreakingNews(newArticle);
      }
    }
    return ref.read(breakingNewsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getaBreakibgNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Center(child: Text("${snapshot.error}")));
          }
          if (snapshot.hasData) {
            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  CarouselSlider.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index, realIndex) =>
                          getContainer(snapshot.data[index], context),
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: .8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height)),
                ],
              ),
            );
          }
        }
        return SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

Widget getContainer(NewsArticle news, context) {
  return InkWell(
    borderRadius: BorderRadius.circular(16),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WebViewScreen(url: news.url);
        },
      ));
    },
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            news.urlToImage!,
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          top: 130,
          child: Container(
            alignment: Alignment.center,
            height: 130,
            padding: const EdgeInsets.only(right: 8,left: 8,bottom:0 ),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Colors.black54),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              news.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    ),
  );
}

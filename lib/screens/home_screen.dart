import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/category_data.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/provider/list_provider.dart';
import 'package:news_app/screens/view_all_screen.dart';
import 'package:news_app/widgets/category_view_widget.dart';
import 'package:news_app/widgets/slider_view_widget.dart';
import 'package:news_app/widgets/trending_view_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                  fontSize: 28),
            ),
            Text(
              "App",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CategoryView(cat: categoryModelList[index]),
                    itemCount: categoryModelList.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breaking News!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ViewAll(
                                    articles: ref.read(breakingNewsProvider),
                                    title: "Breaking News");
                              },
                            ),
                          );
                        },
                        child: Text(
                          "View All",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SliderView(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewAll(
                                articles: ref.read(trendingNewsProvider),
                                title: "Trending News");
                          },
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              ),
            ),
          ),
          const TrendingView(
            type: NewsTypes.trendingNews,
            customScroll: true,
            title: "Trending News",
          )
        ],
      ),
    );
  }
}

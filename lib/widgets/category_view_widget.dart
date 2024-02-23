import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/trending_view_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.cat});
  final CategoryModel cat;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              cat.img,
              fit: BoxFit.cover,
              width: 120,
              height: 60,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TrendingView(type: cat.type, customScroll: false,title: cat.title,);
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(16)),
              child: Text(
                cat.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}

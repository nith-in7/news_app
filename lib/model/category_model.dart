class CategoryModel {
  CategoryModel({required this.title, required this.img,required this.type});
  final String title;
  final String img;
  final NewsTypes type;
}

enum NewsTypes {
  brekingNews,
  trendingNews,
  businessNews,
  entertainmentNews,
  generalNews,
  sportsNews,
  healthNews
}

Map<NewsTypes, String> api = {
  NewsTypes.trendingNews:
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.brekingNews:
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.businessNews:
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.generalNews:
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.healthNews:
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.sportsNews:
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
  NewsTypes.entertainmentNews:
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=2d84a5fd96e94df492c1619c6e5e7f9f",
};

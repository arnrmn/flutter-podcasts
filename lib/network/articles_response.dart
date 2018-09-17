class ArticlesResponse {
  final List<Map<String, dynamic>> articles;

  ArticlesResponse({this.articles}) : assert(articles != null);

  ArticlesResponse.fromJson(Map<String, dynamic> json)
      : articles = json['articles'];
}

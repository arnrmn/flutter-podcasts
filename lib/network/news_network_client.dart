import 'dart:async';
import 'dart:convert' as serializer;

import 'package:http/http.dart' as http;
import 'package:podcast/entity/article.dart';

class NewsNetworkClient {
  final String _url =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=57a79eac5a8f44efa2bd3408139b83f3";

  Future<List<Article>> loadArticles() async {
    final http.Response response = await http.get(_url);
    final Map<String, dynamic> jsonString =
        serializer.jsonDecode(response.body);
    final List<dynamic> articlesJson = jsonString['articles'];
    final List<Map<String, dynamic>> articleMaps =
        List<Map<String, dynamic>>.from(articlesJson);

    final List<Article> articles =
        articleMaps.map((articleMap) => Article.fromJson(articleMap)).toList();

    return articles;
  }
}

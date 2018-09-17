import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podcast/entity/article.dart';
import 'package:podcast/network/articles_response.dart';

class NewsNetworkClient {
  final String _url =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=57a79eac5a8f44efa2bd3408139b83f3";

  Future<List<Article>> loadArticles() async {
    final response = await http.get(_url);
    final jsonResponse = json.decode(response.body);
    final articlesResponse = ArticlesResponse.fromJson(jsonResponse);
    final articles = articlesResponse.articles
        .map((articleJson) => Article.fromJson(articleJson));

    return articles;
  }
}

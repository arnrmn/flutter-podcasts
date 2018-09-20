import 'dart:async';

import 'package:flutter/material.dart';
import 'package:podcast/entity/article.dart';
import 'package:podcast/network/news_network_client.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: Center(
        child: FutureBuilder<List<Article>>(
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Column(children: _buildArticles(snapshot.data));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          },
          future: _fetchData(),
        ),
      ),
    );
  }

  List<Widget> _buildArticles(List<Article> articles) {
    return articles.map((article) => Text(article.title)).toList();
  }

  Future<List<Article>> _fetchData() {
    NewsNetworkClient client = NewsNetworkClient();
    return client.loadArticles();
  }
}

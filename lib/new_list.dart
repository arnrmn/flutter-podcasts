import 'dart:async';

import 'package:flutter/material.dart';
import 'package:podcast/entity/article.dart';
import 'package:podcast/network/news_network_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:podcast/news_details.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: Center(
        child: FutureBuilder<List<Article>>(
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: _buildArticles(snapshot.data, context));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
          future: _fetchData(),
        ),
      ),
    );
  }

  List<Widget> _buildArticles(List<Article> articles, BuildContext context) {
    return articles
        .map((article) => _buildArticleCard(article, context))
        .toList();
  }

  Future<List<Article>> _fetchData() {
    return NewsNetworkClient().loadArticles();
  }

  Widget _buildArticleCard(Article article, BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsDetailsScreen()));
        },
        child: Row(
          children: <Widget>[
            Container(
              width: 160.0,
              height: 90.0,
              child:
                  Image(image: CachedNetworkImageProvider(article.urlToImage)),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.title),
            )),
          ],
        ),
      ),
    );
  }
}

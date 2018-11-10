import 'package:flutter/material.dart';
import 'package:podcast/entity/article.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;

  const NewsDetailsScreen(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Center(child: Text("Details")),
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:podcast/entity/article.dart';

@JsonSerializable()
class ArticleResponse {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  ArticleResponse({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  Article toArticle() {
    return Article(
        author: author == null ? "" : author,
        title: title == null ? "" : title,
        description: description == null ? "" : description,
        url: url == null ? "" : url,
        urlToImage: urlToImage == null ? "" : urlToImage,
        publishedAt: publishedAt == null ? "" : publishedAt);
  }
}

import 'package:meta/meta.dart';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Article({
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
  })  : assert(author != null),
        assert(title != null),
        assert(description != null),
        assert(url != null),
        assert(urlToImage != null),
        assert(publishedAt != null);
}

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _fontStyle = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JRE Podcast"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final _tiles = _saved.map((WordPair words) {
        return ListTile(
          title: Text(
            words.asPascalCase,
            style: _fontStyle,
          ),
        );
      });

      final _divided =
          ListTile.divideTiles(tiles: _tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: const Text("Favourites"),
        ),
        body: ListView(
          children: _divided,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair words) {
    final bool _isSaved = _saved.contains(words);

    return ListTile(
      title: Text(
        words.asPascalCase,
        style: _fontStyle,
      ),
      trailing: Icon(
        _isSaved ? Icons.favorite : Icons.favorite_border,
        color: _isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_isSaved) {
            _saved.remove(words);
          } else {
            _saved.add(words);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() => RandomWordsState();
}

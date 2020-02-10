import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override

  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override

  final _sugestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _sugestions.length ) {
          _sugestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_sugestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: _buildSuggestions(),
    );
  }
}
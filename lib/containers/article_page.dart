import 'package:flutter/material.dart';
import 'package:flutter_common/components/article_item.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(child: ArticleItem()),
    );
  }
}

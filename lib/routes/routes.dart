import 'package:flutter/material.dart';
import 'package:flutter_common/containers/article_list.dart';
import 'package:flutter_common/containers/article_page.dart';

Map<String, WidgetBuilder> routes = {
  '/articles': (context) => ArticleList(),
  '/article': (context) => ArticlePage()
};

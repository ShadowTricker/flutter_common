import 'package:flutter/material.dart';

import 'article_footer.dart';
import 'article_header.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [ArticleHeader(), _buildContent(context), ArticleFooter()],
    ));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      child: Text('content'),
    );
  }
}

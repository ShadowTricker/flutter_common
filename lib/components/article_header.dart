import 'package:flutter/material.dart';
import 'package:flutter_common/constants/my_colors.dart';

class ArticleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Text('岳阳楼记', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: MyFontColors.black_33
          )),
          Spacer(),
          Text('范仲淹', style: TextStyle(
            fontSize: 14,
            color: MyFontColors.black_33
          ))
        ]
      ),
      padding: EdgeInsets.symmetric(vertical: 4),
    );
  }
}

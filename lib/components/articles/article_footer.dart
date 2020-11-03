import 'package:flutter/material.dart';
import 'package:flutter_common/constants/my_colors.dart';

class ArticleFooter extends StatefulWidget {

  @override
  _ArticleFooterState createState() => _ArticleFooterState();

}

class _ArticleFooterState extends State<ArticleFooter> {

  bool isThumbed = false;
  bool isCoined = false;
  bool isFavor = false;

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconButton(
          Icons.thumb_up,
          onPressed: toggleThumb,
          onLongPress: turnAllOn,
          color: isThumbed ? themeColor : MyColors.black_99
          // color: Theme.of(context).primaryColor
        ),
        _buildIconButton(
          Icons.monetization_on,
          onPressed: toggleCoin,
          color: isCoined ? themeColor : MyColors.black_99
          // color: Theme.of(context).primaryColor
        ),
        _buildIconButton(
          Icons.bookmark,
          onPressed: toggleFavor,
          color: isFavor ? themeColor : MyColors.black_99
          // color: Theme.of(context).primaryColor
        )
      ],
    );
  }

  Widget _buildIconButton(
    IconData icon,
    {
      Color color,
      Function onPressed,
      Function onLongPress
    }
  ) {
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Container(
        child: Icon(icon, color: color),
        padding: EdgeInsets.all(10.0),
      ),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  void toggleThumb() {
    setState(() {
      isThumbed = !isThumbed;
    });
  }

  void toggleCoin() {
    setState(() {
      isCoined = !isCoined;
    });
  }

  void toggleFavor() {
    setState(() {
      isFavor = !isFavor;
    });
  }

  void turnAllOn() {
    setState(() {
      isThumbed = true;
      isCoined = true;
      isFavor = true;
    });
  }

}

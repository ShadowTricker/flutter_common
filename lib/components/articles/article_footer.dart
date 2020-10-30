import 'package:flutter/material.dart';
import 'package:flutter_common/constants/my_colors.dart';

class ArticleFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconButton(
          Icons.thumb_up,
          onPressed: () {},
          onLongPress: null,
          label: '1',
          color: MyColors.black_99
          // color: Theme.of(context).primaryColor
        ),
        _buildIconButton(
          Icons.monetization_on,
          onPressed: () {},
          label: '2',
          color: MyColors.black_99
          // color: Theme.of(context).primaryColor
        ),
        _buildIconButton(
          Icons.bookmark,
          onPressed: () {},
          label: '3',
          color: MyColors.black_99
          // color: Theme.of(context).primaryColor
        )
      ],
    );
  }

  FlatButton _buildIconButton(
    IconData icon,
    {
      String label = '',
      Color color,
      Function onPressed,
      Function onLongPress
    }
  ) {
    return FlatButton.icon(
      onPressed: onPressed,
      onLongPress: onLongPress,
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: color))
    );
  }
}

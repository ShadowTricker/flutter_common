import 'package:flutter/material.dart';
import 'package:flutter_common/components/favor/favor_item.dart';

class FavorList extends StatefulWidget {

  @override
  _FavorListState createState() => _FavorListState();

}

class _FavorListState extends State<FavorList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: FavorItem(),
          onTap: () {
            Navigator.of(context).pushNamed('/article');
          }
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0.5,
        color: Colors.black26,
      )
    );
  }

}

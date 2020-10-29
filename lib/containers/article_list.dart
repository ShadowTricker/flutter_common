import 'package:flutter/material.dart';
import 'package:flutter_common/components/articles/article_item.dart';

class ArticleList extends StatefulWidget {

  @override
  _ArticleListState createState() => _ArticleListState();

}

class _ArticleListState extends State<ArticleList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _buildbody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.local_library)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.account_box)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      )
    );
  }

  Widget _buildbody(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ArticleItem(),
          onTap: () {
            print(index);
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

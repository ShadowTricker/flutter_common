import 'package:flutter/material.dart';
import 'package:flutter_common/components/articles/article_item.dart';
import 'package:flutter_common/components/drawer/drawer.dart';
import 'package:flutter_common/constants/my_colors.dart';

class ArticleList extends StatefulWidget {

  @override
  _ArticleListState createState() => _ArticleListState();

}

class _ArticleListState extends State<ArticleList> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Articles', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Builder(builder: (context) => Text('')),
      ),
      drawer: DrawerWidget(logout: () {}, userName: 'Shadow'),
      body: _buildbody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: themeColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.local_library, color: MyColors.black_99),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.account_box, color: MyColors.black_99),
              onPressed: () {
                // _openDrawer();
                Navigator.of(context).pushNamed('/sign-in');
              },
            ),
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
            Navigator.of(context).pushNamed('/favors');
          }
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0.5,
        color: Colors.black26,
      )
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  /* void _closeDrawer() {
    Navigator.of(context).pop();
  } */

}

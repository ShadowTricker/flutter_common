import 'package:flutter/material.dart';
import 'package:flutter_common/components/articles/article_item.dart';
import 'package:flutter_common/components/drawer/drawer.dart';
import 'package:flutter_common/components/sign_in_state/sign_in_state.dart';
import 'package:flutter_common/constants/my_colors.dart';

class ArticleList extends StatefulWidget {

  @override
  _ArticleListState createState() => _ArticleListState();

}

class _ArticleListState extends State<ArticleList> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showDialog = false;
  // curIndex = -1 to publish
  // curIndex > 0 to article
  int curIndex = -1;

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
        onPressed: () {
          final String userName = _getUserName(context);
          if (userName.length > 0) {
            Navigator.of(context).pushNamed('/publish');
          } else {
            setState(() {
              showDialog = true;
              curIndex = -1;
            });
          }
        },
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
                final String userName = _getUserName(context);
                if (userName.length > 0) {
                  _openDrawer();
                } else {
                  Navigator.of(context).pushNamed('/sign-in');
                }
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      )
    );
  }

  Widget _buildbody(BuildContext context) {
    return Stack(
      children: [
        _buildList(context),
        Visibility(
          visible: showDialog,
          child: Positioned(
            child: Container(
              child: _buildDialog(context),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, .3)
              ),
            )
          )
        )
        /* if (showDialog) Positioned(
          child: Container(
            child: _buildDialog(context),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, .3)
            ),
          )
        ) */
      ],
    );
  }

  ListView _buildList(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: ArticleItem(),
          onTap: () {
            final String userName = _getUserName(context);
            if (userName.length > 0) {
              Navigator.of(context).pushNamed('/article', arguments: index);
            } else {
              setState(() {
                showDialog = true;
                curIndex = index;
              });
            }
          }
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 0.5,
        color: Colors.black26,
      )
    );
  }

  Center _buildDialog(BuildContext context) {
    final Color themeColor = Theme.of(context).primaryColor;
    return Center(
      child: Container(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Sign in to see more',
                    style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline
                    ),
                  ),
                  onPressed: () {
                    int index = curIndex;
                    setState(() {
                      curIndex = -1;
                    });
                    Navigator.of(context)
                      .pushNamed('/sign-in', arguments: index);
                  },
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.cancel_outlined, color: MyColors.black_c4,),
                onPressed: () {
                  setState(() {
                    showDialog = false;
                  });
                }
              ),
            )
          ],
        ),
        width: 240.0,
        height: 160.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)
        ),
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  String _getUserName(BuildContext context) {
    return SignInStateWidget.of(context).signInUser;
  }

  /* void _closeDrawer() {
    Navigator.of(context).pop();
  } */

}

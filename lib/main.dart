import 'package:flutter/material.dart';
import 'package:flutter_common/routes/routes.dart';

import 'components/sign_in_state/sign_in_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String userName = '';

  @override
  Widget build(BuildContext context) {
    return SignInStateWidget(
      signInUser: userName,
      setSignInUser: setUserName,
      child: MaterialApp(
        title: 'Flutter Common',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/articles',
        routes: routes
      ),
    );
  }

  void setUserName(String name) {
    setState(() {
      userName = name;
    });
  }

}

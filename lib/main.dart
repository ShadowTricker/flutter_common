import 'package:flutter/material.dart';
import 'package:flutter_common/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Common',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff42B3FF),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/articles',
        routes: routes);
  }
}

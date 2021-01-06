import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studio16/UI/home_page.dart';

import 'UI/navigation_bar.dart';
import 'UI/splash_screen.dart';
import 'UI/walkthrough.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/walkthrough': (BuildContext context) => new walkthrough(),
        '/main': (BuildContext context) => new navigation_bar()
      },
    );
  }
}



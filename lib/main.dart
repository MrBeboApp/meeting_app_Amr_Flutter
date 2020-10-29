import 'package:flutter/material.dart';
import 'package:metting_app/homePageTWo.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meeting',
      home: HomePageTwo(),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:metting_app/homePageTWo.dart';
import 'package:metting_app/registerPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          FlatButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageTwo()));
          }, icon: Icon(Icons.home), label: Text("Home")),
          FlatButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
          }, icon: Icon(Icons.account_box), label: Text("Create Account")),
        ],
      ),
    );
  }
}

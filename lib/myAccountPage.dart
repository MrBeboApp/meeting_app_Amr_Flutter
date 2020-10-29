import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  final String token ;

  MyAccountPage(this.token);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child:
          Text(widget.token,style: TextStyle(color: Colors.white,fontSize: 10),),),
      ),
    );
  }
}

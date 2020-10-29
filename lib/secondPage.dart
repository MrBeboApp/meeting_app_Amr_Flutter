import 'package:flutter/material.dart';
import 'package:metting_app/postModel.dart';

class SecondPage extends StatefulWidget {

  final PostModel post;


  SecondPage(this.post);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Center(
        child: Icon(widget.post.icon,size: 200,color: Colors.white,),
      ),
    );
  }
}
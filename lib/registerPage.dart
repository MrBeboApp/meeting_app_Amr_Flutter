import 'package:flutter/material.dart';
import 'package:metting_app/myAccountPage.dart';
import 'package:metting_app/widgets/myDrawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _userNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              FlatButton(onPressed: () async{


                String userName = _userNameController.text;
                String emailText = _emailController.text;
                String password = _passwordController.text;


                var url = "http://192.168.1.5:1337/auth/local/register";
                http.Response response =  await http.post(url,body: {
                  "email":emailText,
                  "password":password,
                  "username":userName
                });

                if(response.statusCode == 200){
                  var body = jsonDecode(response.body);
                  String token = body["jwt"];
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("token", token);



                  print(prefs.getString("token"));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAccountPage(body["jwt"])));

                } else {
                  var body = jsonDecode(response.body);
                  print(body["message"][0]["messages"][0]["message"]);
                }




              }, child: Container(
                color: Colors.teal,

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text("Create Account",style: TextStyle(color: Colors.white),)),
                ),
              ))
            ],
          ),
        ),
      ),
    );

  }
}

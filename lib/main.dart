import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Views/LoginPages/LoginPage.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primaryColor: bibiBlue ),
    );
  }
}




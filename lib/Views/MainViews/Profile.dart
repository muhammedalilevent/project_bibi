import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Page"),
        actions: <Widget>[
          FlatButton(onPressed:(){

          },
          child: Text("Çıkış Yap"),)
        ],
      ),
    );
  }
}

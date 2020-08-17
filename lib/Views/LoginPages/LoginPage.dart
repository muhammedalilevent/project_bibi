import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_bibi/Views/MainViews/CorePage.dart';
import 'package:project_bibi/Views/LoginPages/RegisterPage.dart';
import 'package:hexcolor/hexcolor.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //GLOBAL VARIABLE DECLARATIONS
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  String message = '';
  bool otomatikKontrol = false;
  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");

  //HTTP REQUEST PHASE
  Future<List> login() async {
    debugPrint("login fonks girildi");
    final response = await http
        .post("http://leventsoftware.com/leventAPI/login.php", body: {
      "email": controllerEmail.text,
      "password": controllerPass.text,
    });
    debugPrint("http Post Çalıştırıldı"+response.statusCode.toString()+" "+response.body);

    var datauser = json.decode(response.body);

    if (datauser != null) {
      var mesaage =
          datauser['message'] != null ? datauser['message'] : 'Başarısız';
      if (datauser['success'] == true) {
        debugPrint("MESAJ:" + mesaage);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => CorePage()));
      } else {
        debugPrint("MESAJ:" + mesaage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        autovalidate: otomatikKontrol,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 250.0,
                height: 250.0,
                padding: EdgeInsets.only(top: 30.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFFFFF),
                  child: Image(
                    image: AssetImage("assets/images/bibi-png.png"),
                  ),
                ),
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      //TFF EMAİL KONTEYNIRI
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                       // controller: controllerEmail,
                        obscureText: false,
                        initialValue: "enesozudogruu@gmail.com",
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "abc@tmail.com",
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),

                        ),
                        validator: _emailKontrol,
                      ),
                    ),
                    Container(
                      //TEXTFORM FİELD ŞİFRE ALANI KONTEYNIRI
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                       // controller: controllerPass,
                        obscureText: true,
                        initialValue: "12345678",
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "******",
                          labelText: "Şifre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),

                        ),
                        validator: (String girilenVeri) {
                          if (girilenVeri.length < 6) {
                            return "Hata Var!";
                          } else
                            return null;
                        },
                      ),
                    ),
                    /*Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, right: 32),
                        child: Text(
                          'Remember Password',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),*/

                    Container(
                      //GİRİŞ YAP BUTONU KONTEYNIRI
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.only(top: 10),
                      child: RaisedButton(

                        child: Text("Giriş Yap",
                            style: TextStyle(color: Colors.white)),
                        color: bibiBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        highlightColor: bibiPink,
                        onPressed: () {
                          debugPrint("Tuşa Basıldı");
                          setState(() {
                            otomatikKontrol = true;
                          });
                          login();
                        },
                      ),
                    ),

                    Container(
                      //KAYIT BUTONU KONTEYNIRI
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.only(top: 10),
                      child: RaisedButton(
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                        //color: Colors.blueAccent,
                        color: bibiPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        highlightColor: bibiBlue,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>RegisterPage()
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }
}

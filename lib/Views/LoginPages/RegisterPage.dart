import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:project_bibi/Views/LoginPages/LoginPage.dart';
import 'package:project_bibi/Views/MainViews/CorePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../MainViews/CorePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Controller Tanımlamaları
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  bool otomatikKontrol = false;
  Color bibiPink = Hexcolor("#fd79b2");
  final _formKey = GlobalKey<FormState>();
  Color bibiBlue = Hexcolor("#51c1be");
  int secilenYas = 15;
  var ages = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100
  ];

  String secilenCinsiyet = "Erkek";
  var cinsiyet = ["Erkek", "Kadın"];
  bool gender = true;

  @override
  Widget build(BuildContext context) {
    //API STUFF
    Future<List> signUp() async {
      debugPrint("signUp fonks girildi");
      final response = await http
          .post("http://leventsoftware.com/leventAPI/signUp.php", body: {
        "username": controllerName.text,
        "surname": controllerSurname.text,
        "email": controllerEmail.text,
        "gender": gender ? "1" : "0",
        "age": "$secilenYas",
        "password": controllerPassword.text,
      });
      debugPrint("http Post Çalıştırıldı" +
          response.statusCode.toString() +
          " " +
          response.body);
      var datauser = json.decode(response.body);

      if (datauser != null) {
        var message =
            datauser['message'] != null ? datauser['message'] : 'Başarısız';
        if (datauser['success'] == true) {
          Fluttertoast.showToast(
              msg: "Kayıt Başarılı Hoşgeldin ",
              textColor: Colors.black,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1);
          debugPrint("MESAJ:" + message);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => CorePage()));
        } else {
          debugPrint("MESAJ:" + message);
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        autovalidate: otomatikKontrol,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: controllerName,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Ahmet",
                  labelText: "Adınız",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bibiPink, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _nameControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: controllerSurname,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Demir",
                  labelText: "Soyadınız",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bibiPink, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _surnameControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controllerEmail,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "abc123@gmail.com",
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bibiPink, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: _emailControl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: controllerPassword,
                validator: (val){
                  if(val.isEmpty)
                    return 'Boş Bırakılamaz';
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "******",
                  labelText: "Şifre",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bibiPink, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: _confirmPass,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "******",
                  labelText: "Şifre Tekrar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bibiPink, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (val){
                  if(val.isEmpty)
                    return 'Empty';
                  if(val != controllerPassword.text)
                    return "Parolalar Eşleşmiyor";
                  return null;
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Yaşınız",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          height: 35,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: DropdownButton<int>(
                            items: ages.map((secilen) {
                              return DropdownMenuItem<int>(
                                child: Text(
                                  "$secilen",
                                  textAlign: TextAlign.center,
                                ),
                                value: secilen,
                              );
                            }).toList(),
                            onChanged: (int secilen) {
                              setState(() {
                                secilenYas = secilen;
                              });
                            },
                            value: secilenYas,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "  Cinsiyetiniz",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          height: 35,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: DropdownButton<String>(
                            items: cinsiyet.map((secilen) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  "$secilen",
                                  textAlign: TextAlign.center,
                                ),
                                value: secilen,
                              );
                            }).toList(),
                            onChanged: (secilen) {
                              setState(() {
                                secilenCinsiyet = secilen;
                                if (secilen == "Erkek")
                                  gender = true;
                                else
                                  gender = false;
                              });
                            },
                            value: secilenCinsiyet,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: RaisedButton(
                  highlightColor: bibiPink,
                  color: bibiBlue,
                  child: Text(
                    'TAMAMLA',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    setState(() {
                      otomatikKontrol = true;
                    });
                    if (_formKey.currentState.validate()) {
                      signUp();
                    }
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: RaisedButton(
                  highlightColor: bibiBlue,
                  hoverColor: Colors.red,
                  color: bibiPink,
                  child: Text(
                    'GERİ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  String _nameControl(String name) {
    if (name.length < 1) {
      return "Bu Alanı Boş Bırakamazsınız";
    } else {
      return null;
    }
  }

  String _surnameControl(String surname) {
    if (surname.length < 1) {
      return "Bu Alanı Boş Bırakamazsınız";
    } else {
      return null;
    }
  }

  /*String _phoneControl(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.length == 0) {
      return 'Bu alanı Boş Bırakamazsınız';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }*/

  String _emailControl(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(mail.length==0)
      return "Bu Alanı Boş Bırakamazsınız";
    else if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  String _passwordControl(String value) {
    if (value.length < 6) {
      return "Şifreniz en az 6 haneli olmalıdır";
    } else
      return null;
  }
}

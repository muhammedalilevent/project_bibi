import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ExpansionTile(
            backgroundColor: index % 2 == 0 ? bibiBlue : bibiPink,
            title: Text(
              "Teknoloji Nedir ?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            leading: CircleAvatar(
              backgroundColor: index % 2 == 0 ? bibiPink : bibiBlue,
              radius: 20,
              child:  Image.asset(
                index % 3 == 0 ?
                "assets/images/technology.png" :
                index % 3 == 1 ? "assets/images/game.png" :
                "assets/images/bilim.png",
                height: 35,
                width: 35,
              ),
            ),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    height: 200,
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? bibiPink : bibiBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Teknoloji bir insan etkinliğidir. İnsanlık tarihinde bilimden ve mühendislikten önce var olmuş olan bir kavramdır. Pek çok yönden bilimin uygulamaya geçirilmiş"
                          " hali olarak görülmektedir. ... Ayrıca üretim yöntemlerinin, yeteneklerin bir araya gelmesini sağlayan bilgi bütününe de teknoloji olarak nitelendirilmektedir.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),


                  Positioned(
                    left: 20,
                    top: 5,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(backgroundColor: Colors.white,child: Text("bE",style: TextStyle(color: Colors.black),),),
                        SizedBox(width: 20,),
                        Text("bibiEkip",style: TextStyle(color: index%2==0 ? bibiBlue : bibiPink,),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
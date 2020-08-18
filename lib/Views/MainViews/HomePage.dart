import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_bibi/DialogScreens/bibidetail_page.dart';
import 'package:project_bibi/Views/MainViews/visitor_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String userName="LeventMarine";
  String questions="Flutter Nedir ? Nerelerde kullanılabilir ? Flutter ne zaman ve kim tarafından ortaya çıktı ? ";
  String answer = "Flutter , Google tarafından geliştirilen açık kaynak kodlu bir mobil uygulama geliştirme SDK’sıdır. Android ve iOS için uygulama geliştirmek ve Google Fuchsia işletim sistemi için uygulama geliştirmek için kullanılır.";


  int comment =250,like=485,dislike=500;
  int total =0;



  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");

  @override
  Widget build(BuildContext context) {

    total = like-dislike;
    return Scaffold(

      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BibiDetailPage()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  //side: BorderSide()
                ) ,
                elevation: 25,
                child: Container(
                  //color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10,bottom: 10,right: 3),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VisitorPage()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius:  25,
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(bottom: 20,left: 5),
                            child: Container(
                                width: MediaQuery.of(context).size.width-100,
                                child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VisitorPage()));
                                    },
                                    child: Text(userName,style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),)
                                )
                            ),
                          ),
                        ],
                      ),
                              SizedBox(height: 5,),


                              Container(
                                  constraints:BoxConstraints(
                                      maxHeight: MediaQuery.of(context).size.height,
                                      maxWidth: MediaQuery.of(context).size.width-25,
                                      minWidth: 150.0,
                                      minHeight: 0
                                  ) ,
                                  child: Text(questions,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                              ),

                      SizedBox(height: 20,),


                      Container(
                          constraints:BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height,
                              maxWidth: MediaQuery.of(context).size.width-25,
                              minWidth: 150.0,
                              minHeight: 0
                          ) ,
                          child: Text(answer,style: TextStyle(color: Colors.black,),textAlign: TextAlign.center,)
                      ),



                      SizedBox(height: 15,),

                      //Card İçerisinde Bulunan Yorum Like ve Text lerin İçerisinde Bulunduğu Container
                      Container(
                        width: MediaQuery.of(context).size.width-75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            //İç İçe Icon-Text
                            Row(
                              children: <Widget>[
                                Image.asset("assets/images/questions_answer_icon/answer.png",height: 25,width: 25,),
                                SizedBox(width: 10,),
                                Text(comment.toString())
                              ],
                            ),

                            //İç İçe Icon-Text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/questions_answer_icon/like.png",height: 25,width: 25,),

                                SizedBox(width: 25,),

                                Image.asset("assets/images/questions_answer_icon/dislike.png",height: 25,width: 25,),
                                SizedBox(width: 30,),
                                Text(
                                  total.toString(),
                                  style: TextStyle(
                                      color: total > 0 ? Colors.green.shade700 : Colors.red.shade700
                                  ),
                                )


                                //İç İçe Icon-Tex
                              ],
                            ),



                          ],

                        ),
                      ),
                      SizedBox(height: 15,)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }



  /*
          //ESKİ HALİ
  return ExpansionTile(
            backgroundColor:  bibiPink,
            title: Text(
              "Teknoloji Nedir ?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            leading: CircleAvatar(
              backgroundColor: bibiBlue,
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
                      color: bibiBlue,
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
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ProfilDialog(context: context,),
                              ));
                            },
                            child: Text("bibiEkip",style: TextStyle(color:bibiPink,),)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );


   */







}
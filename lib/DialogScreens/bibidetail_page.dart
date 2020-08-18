import 'package:flutter/material.dart';

class BibiDetailPage extends StatefulWidget {



  @override
  _BibiDetailPageState createState() => _BibiDetailPageState();
}

class _BibiDetailPageState extends State<BibiDetailPage> {


  String answer =
      "Flutter , Google tarafından geliştirilen açık kaynak kodlu bir mobil uygulama geliştirme SDK’sıdır. Android ve iOS için uygulama geliştirmek ve Google Fuchsia işletim sistemi için uygulama geliştirmek için kullanılır.";
  String questions =
      "Flutter Nedir ? Nerelerde kullanılabilir ? Flutter ne zaman ve kim tarafından ortaya çıktı ? ";

  int comment = 250,
      like = 485,
      dislike = 15;
  int total = 0;


  @override
  Widget build(BuildContext context) {
    total = like - dislike;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(onTap: () => Navigator.of(context).pop(),child:
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Icon(Icons.arrow_back),
            )),
            elevation: 0,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 25, bottom: 15, right: 15),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: 30,
                    ),
                  ),
                  Text(
                    "bibiEkip",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery
                          .of(context)
                          .size
                          .height,
                      maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width - 15,
                      minWidth: 150.0,
                      minHeight: 0),
                  child: Text(
                    questions,
                    style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),

              SizedBox(
                height: 10,
              ),

              //Card İçerisinde Bulunan Yorum Like ve Text lerin İçerisinde Bulunduğu Container
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //İç İçe Icon-Text
                    Row(
                      children: <Widget>[
                        Image.asset("assets/images/questions_answer_icon/answer.png",height: 25,width: 25,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(comment.toString())
                      ],
                    ),

                    //İç İçe Icon-Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/questions_answer_icon/like.png",height: 25,width: 25,),

                        SizedBox(
                          width: 25,
                        ),

                        Image.asset("assets/images/questions_answer_icon/dislike.png",height: 25,width: 25,),

                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          total.toString(),
                          style: TextStyle(
                              color: total > 0
                                  ? Colors.green.shade700
                                  : Colors.red.shade700),
                        )

                        //İç İçe Icon-Tex
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      maxHeight: MediaQuery
                          .of(context)
                          .size
                          .shortestSide),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 5, right: 5, bottom: 55),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.deepOrange,

                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width - 75,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              //tumSoruListesi[index].kullanici,
                                              "Kullanıcı $index",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("23.06.10    15:45"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(answer + index.toString()),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 75,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    //İç İçe Icon-Text
                                    Row(
                                      children: <Widget>[
                                        Image.asset("assets/images/questions_answer_icon/comment.png",height: 25,width: 25,),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(comment.toString())
                                      ],
                                    ),

                                    //İç İçe Icon-Text
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset("assets/images/questions_answer_icon/like.png",height: 25,width: 25,),

                                        SizedBox(
                                          width: 25,
                                        ),

                                        Image.asset("assets/images/questions_answer_icon/dislike.png",height: 25,width: 25,),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          total.toString(),
                                          style: TextStyle(
                                              color: total > 0
                                                  ? Colors.green.shade700
                                                  : Colors.red.shade700),
                                        )

                                        //İç İçe Icon-Tex
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      child:  Image.asset("assets/images/questions_answer_icon/comment.png",height: 20,width: 20,),
                    ),
                  ),


                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter a Comment",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide()
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          //icerik=value;
                        });
                      },
                    ),

                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            //tumSoruListesi.add(Soru("Soru", icerik, "bibiEkip"));
                          });
                        },
                        child: Icon(Icons.send)
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}





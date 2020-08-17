import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_bibi/DialogScreens/bibidetail_page.dart';
import 'package:project_bibi/Views/follow_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{

  String userName="LeventMarine";
  String questions="Flutter Nedir ? Nerelerde kullanılabilir ? Flutter ne zaman ve kim tarafından ortaya çıktı ? ";
  String answer = "Flutter , Google tarafından geliştirilen açık kaynak kodlu bir mobil uygulama geliştirme SDK’sıdır. Android ve iOS için uygulama geliştirmek ve Google Fuchsia işletim sistemi için uygulama geliştirmek için kullanılır.";


  int comment =250,like=485,dislike=500;
  int total =0;

TabController tabController;

String bilgi ="Database Management";
TextEditingController _textEditingController = TextEditingController();



  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");


@override
  void initState() {
    super.initState();
    tabController=TabController(length: 3,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          FlatButton(onPressed:(){

          },
          child: Text("Çıkış Yap",textScaleFactor: 0.8,style: TextStyle(color: bibiPink),),)
        ],
      ),

      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 35,
                      ),
                    ),


                    Column(

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:25),
                          child: Container(
                            width: MediaQuery.of(context).size.width-100,
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.center,

                              children: <Widget>[
                                Text("bibiEkip",style: TextStyle(fontSize: 15,color: Colors.grey.shade700,fontWeight: FontWeight.bold),),

                                //SizedBox(width: 15,),

                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Software Engineering",style: TextStyle(fontSize: 15),),


                                          Row(
                                            children: [
                                              Text(bilgi,style: TextStyle(fontSize: 15),),
                                              InkWell(
                                                onTap: (){
                                                  getDialog();
                                                },
                                                  child: Icon(Icons.edit)
                                              )
                                            ],
                                          ),


                                      Text("http://leventsoftware.com.tr",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),


                      ],
                    ),

                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FollowPage()));
                          },
                          child: Text("256 Takipçi",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                      ),

                      InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FollowPage()));
                          },
                          child: Text("158 Takip",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      ),




                      Text("48 Total Puan",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                SizedBox(height: 15,),

              ],

            ),

          ),



          Theme(
            data: ThemeData(
              primaryColor: Colors.white
            ),
            child: Container(
              height: 50,
              child: AppBar(
                bottom: getTabBar(),
              ),
            ),
          ),

          Expanded(
            child: Container(
              constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.shortestSide),
              child:TabBarView(
                //physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: <Widget>[
                  getMyBibi(),
                  getMyAnswers(),
                  getMyBibi()

              ],),

            ),
          )








        ],
      ),

    );

  }

TabBar getTabBar() {
  return TabBar(
    unselectedLabelColor: Colors.grey.shade600,
    labelColor: bibiPink,
    indicatorColor: bibiPink,
    controller: tabController,
    tabs: <Widget>[
      Tab(text: "My Bibi's" ,),
      Tab(text: "My Answer's"),
      Tab(text: "Like Bibi's"),
    ],
  );
}



  Widget getMyBibi(){
    return ListView.builder(
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
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius:  25,
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,left: 5),
                          child: Container(
                              width: MediaQuery.of(context).size.width-100,
                              child: Text(userName,style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.bold),)),
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
                    )
                  ],
                ),
              ),
            ),
          );
        });

  }


  Widget getMyAnswers(){
  return ListView.builder(
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
      });
  }



  Dialog getDialog(){
  showDialog(

    context: context,
  builder: (context){
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ) ,

      child: Container(
        color: Colors.grey.shade300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kendinizi Bir Cümle İle Anlatınız",),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _textEditingController,
                maxLength: 25,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Cümlenizi Giriniz",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(20),
                )
              ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Gereksiz!!
                Opacity(opacity: 0,child: RaisedButton()),


                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)

                  ),
                  color: bibiBlue,
                  child: Text(
                    "Kaydet"
                  ),
                  onPressed: (){

                    setState(() {
                      if(_textEditingController.text.trim().length!=0)
                        {
                          bilgi = _textEditingController.text;
                          Navigator.of(context).pop();
                        }
                    });

                  },

                )
              ],
            )
          ],
        ),
      ),
    );
  }

  );

  }
}
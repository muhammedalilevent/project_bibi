import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{

TabController tabController;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text("Profil Page"),
        actions: <Widget>[
          FlatButton(onPressed:(){

          },
          child: Text("Çıkış Yap"),)
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 5),
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
                                        Text("Database Management",style: TextStyle(fontSize: 15),),
                                        Text("http://leventsoftware.com.tr",style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),

                          Container(
                            width: MediaQuery.of(context).size.width-150,
                            child: Row(
                              crossAxisAlignment:CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("256 Takipçi",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Text("158 Takip",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                Text("48 Total Puan",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 15,),

                ],

              ),

            ),



            Container(
              height: 50,
              child: AppBar(
                bottom: getTabBar(),
              ),
            ),

            Container(
              constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.shortestSide),
              child:TabBarView(
                //physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: <Widget>[
                Container(
                  color: Colors.white,
                  child: ListView.builder(itemCount: 15,itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 50,
                        //color: Colors.yellowAccent,
                        child: Column(
                          children: <Widget>[
                            Center(child: Text(" İtem ${index.toString()}")),
                            Center(child: Text(" İtem ${index.toString()}")),
                          ],
                        ),
                      ),
                    );
                  })
                ),

                Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text("TABVİEW 2",style: TextStyle(fontSize: 54,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),

                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("TABVİEW 3",style: TextStyle(fontSize: 54,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                ),

              ],),

            )








          ],
        ),
      ),

    );


  }

TabBar getTabBar() {
  return TabBar(
    controller: tabController,
    tabs: <Widget>[
      Tab(text: "My Bibi's" ,),
      Tab(text: "My Answer's"),
      Tab(text: "Like Bibi's"),
    ],
  );
}
}
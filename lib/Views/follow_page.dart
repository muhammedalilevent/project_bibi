import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");

  String butonText="Takip Et";

  @override
  Widget build(BuildContext context) {
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


      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("${index.toString()}"),
                  ),

                  title: Text("Kullanıcı ${index.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(15),
                    ),
                    child: Text(butonText),
                    color: bibiBlue,
                    onPressed: (){
                    },
                  ),
                ),
              ),

              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 5,)
            ],
          );
        },
      ),
    );




  }
}

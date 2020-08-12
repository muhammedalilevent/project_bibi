import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilDialog extends StatefulWidget {

  final BuildContext context;

  const ProfilDialog({Key key, this.context}) : super(key: key);


  @override
  _ProfilDialogState createState() => _ProfilDialogState();
}

class _ProfilDialogState extends State<ProfilDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

         //GENEL COLUMN
         child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(top: 40,left: 20,right: 15),
                   child: CircleAvatar(
                     backgroundColor: Colors.orange,
                     radius: 35,
                   ),
                 ),


                 Column(

                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(top:45),
                       child: Container(
                         width: MediaQuery.of(context).size.width-150,
                         child: Row(
                           crossAxisAlignment:CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                           children: <Widget>[
                             Text("bibiEkip",style: TextStyle(fontSize: 15,color: Colors.grey.shade700),),
                             SizedBox(width: 15,),
                             Opacity(opacity: 0,child: Text("bibiEkip",style: TextStyle(fontSize: 10,color: Colors.grey.shade700),)),
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

             SizedBox(height: 50,),

              Container(
                color: Colors.pinkAccent,
                height: 400,
                width: double.infinity,
              )



           ],

         ),

       ),

    );
  }
}

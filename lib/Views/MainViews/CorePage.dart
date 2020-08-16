import 'package:flutter/material.dart';
import 'package:project_bibi/Views/MainViews/ArchivePage.dart';
import 'package:project_bibi/Views/MainViews/BibiPage.dart';
import 'package:project_bibi/Views/MainViews/HomePage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'ProfilePage.dart';
import '../../DialogScreens/AddBibiQuestionDS.dart';

class CorePage extends StatefulWidget {
  @override
  _CorePageState createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {
    return GetBottomNavBar();
  }
}


class GetBottomNavBar extends StatefulWidget {
  @override
  _GetBottomNavBarState createState() => _GetBottomNavBarState();
}

class _GetBottomNavBarState extends State<GetBottomNavBar> {

  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");

  int menuItem = 0;

  final List<Widget> tumSayfalar = [
    HomePage(),
    BibiPage(),
    ArchivePage(),
    Profile(),
  ];

  Widget currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        appBar: AppBar(
          title: Text(
            "Sample Bottom NavBar",
            style: TextStyle(color: Colors.white),
          ),
        ),
       */
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Image.asset("assets/images/bottom_navigation_bar_icon/question.png",height: 30,width: 30,),

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [bibiBlue, bibiPink])
            ),


          ),
          //backgroundColor: Colors.green,
          onPressed: () {
            getCustomDialog(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color:bibiPink,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HomePage();
                          menuItem = 0;
                        });
                      },
                      child:
                          Image.asset("assets/images/bottom_navigation_bar_icon/home.png",height: 30,width: 30,)

                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = BibiPage();
                          menuItem = 1;
                        });
                      },
                      child:
                          Image.asset("assets/images/bottom_navigation_bar_icon/bibibeyaz-png.png",height: 50,width: 50,),

                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ArchivePage();
                          menuItem = 2;
                        });
                      },
                      child:
                          Image.asset("assets/images/bottom_navigation_bar_icon/award.png",height: 30,width: 30,)

                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Profile();
                          menuItem = 3;
                        });
                      },
                      child:
                          Image.asset("assets/images/bottom_navigation_bar_icon/user.png",height: 30,width: 30,)

                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void getCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return DialogScreen();
        }
    );
  }


}
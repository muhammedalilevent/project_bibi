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
            child: Icon(
              Icons.question_answer,
            ),

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
          color:
          menuItem % 2 == 0 ? bibiBlue : bibiPink,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: menuItem == 0
                                ? bibiPink
                                : Colors.white,
                          ),
                          Text(
                            "AnaSayfa",
                            style: TextStyle(
                              color: menuItem == 0
                                  ? bibiPink
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = BibiPage();
                          menuItem = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/images/bibi-png.png",height: 30,width: 30,),
                          Text(
                            "Bibi",
                            style: TextStyle(
                              color: menuItem == 1 ? bibiBlue : Colors.white,
                            ),
                          ),
                        ],
                      ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            color: menuItem == 2
                                ? bibiPink
                                : Colors.white,
                          ),
                          Text(
                            "Arşiv",
                            style: TextStyle(
                              color: menuItem == 2
                                  ? bibiPink
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Profile();
                          menuItem = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: menuItem == 3 ? bibiBlue : Colors.white,
                          ),
                          Text(
                            "Profil",
                            style: TextStyle(
                              color: menuItem == 3 ? bibiBlue : Colors.white,
                            ),
                          ),
                        ],
                      ),
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
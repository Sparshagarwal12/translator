// import 'package:flutter_localization_master/pages/quizPage.dart';
import 'package:flutter_localization_master/pages/getLangCode.dart';
import 'package:flutter_localization_master/pages/homePage.dart';
import 'package:flutter_localization_master/pages/quizPages.dart';

import 'BasicHomePage.dart';
import 'chatBot.dart';
import 'grid.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'newsapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mainBoard extends StatefulWidget {
  @override
  _mainBoard createState() => _mainBoard();
}

Future<SharedPreferences> getPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('aadhar', null);
  return prefs;
}

class _mainBoard extends State<mainBoard> {
  int pageIndex = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Quiz(),
    NewsApi(),
    CarouselDemo(),
    ChatBot(),
    // DashBoard(),
    LogoApp(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("India's Fight Agains Corona"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 20.0,
                      //context: context,
                      title: Text("Are you sure to logout"),
                      // content:
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.check_circle),
                            onPressed: () {
                              getPrefs();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false);
                            }),
                        IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                  },
                );
              })
        ],
      ),
      body: _children[_currentIndex],

      // body: Container
      // (

      //   color: Colors.blueAccent,
      //   height: MediaQuery.of(context).size.height,
      //   width:  MediaQuery.of(context).size.height,
      //   // child: Column
      //   //   (
      //   //   mainAxisAlignment: MainAxisAlignment.center,
      //   //   children: <Widget>
      //   //   [
      //   //     Text("This is COVID19",
      //   //     style: TextStyle(color: Colors.white
      //   //                     ),
      //   //         )
      //   //   ],
      //   //   ),

      // ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: 50,

        items: <Widget>[
          Icon(Icons.person, size: 20, color: Colors.white),
          Icon(Icons.web, size: 20, color: Colors.white),
          Icon(Icons.home, size: 20, color: Colors.white),
          Icon(Icons.chat, size: 20, color: Colors.white),
          Icon(Icons.dashboard, size: 20, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 200),
        onTap: onTappedBar,
        // index: 2,
        animationCurve: Curves.bounceInOut,
      ),
    );
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
// class covidimage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage=AssetImage('assets/images/mitrc.png');
//     Image image=Image(image: assetImage,width: 100.0,height: 100.0,);

//     // TODO: implement build
//     return Container(child: image,);
//   }
// }

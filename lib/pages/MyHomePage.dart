// // import 'package:flutter_localization_master/pages/quizPage.dart';
// import 'package:flutter_localization_master/pages/getLangCode.dart';
// import 'package:flutter_localization_master/pages/homePage.dart';
// import 'package:flutter_localization_master/pages/quizPages.dart';

// import 'BasicHomePage.dart';
// import 'chatBot.dart';
// import 'grid.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'newsapi.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class mainBoard extends StatefulWidget {
//   @override
//   _mainBoard createState() => _mainBoard();
// }

// Future<SharedPreferences> getPrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('aadhar', null);
//   return prefs;
// }

// class _mainBoard extends State<mainBoard> {
//   int pageIndex = 0;
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     Quiz(),
//     NewsApi(),
//     CarouselDemo(),
//     ChatBot(),
//     // DashBoard(),
//     LogoApp(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("India's Fight Agains Corona"),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.power_settings_new),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       elevation: 20.0,
//                       //context: context,
//                       title: Text("Are you sure to logout"),
//                       // content:
//                       actions: <Widget>[
//                         IconButton(
//                             icon: Icon(Icons.check_circle),
//                             onPressed: () {
//                               getPrefs();
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomePage()),
//                                   (Route<dynamic> route) => false);
//                             }),
//                         IconButton(
//                             icon: Icon(Icons.cancel),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             })
//                       ],
//                     );
//                   },
//                 );
//               })
//         ],
//       ),
//       body: _children[_currentIndex],

      

//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         color: Colors.black,
//         buttonBackgroundColor: Colors.black,
//         height: 50,

//         items: <Widget>[
//           Icon(Icons.person, size: 20, color: Colors.white),
//           Icon(Icons.web, size: 20, color: Colors.white),
//           Icon(Icons.home, size: 20, color: Colors.white),
//           Icon(Icons.chat, size: 20, color: Colors.white),
//           Icon(Icons.dashboard, size: 20, color: Colors.white),
//         ],
//         animationDuration: Duration(milliseconds: 200),
//         onTap: onTappedBar,
//         // index: 2,
//         animationCurve: Curves.bounceInOut,
//       ),
//     );
//   }

//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/chatBot.dart';
// import 'package:flutter_localization_master/pages/newDeclaration.dart';
import 'package:flutter_localization_master/pages/newsapi.dart';
import 'package:flutter_localization_master/pages/quizPages.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'grid.dart';

class BottomnavBar extends StatefulWidget {
  @override
  _BottomnavBarState createState() => _BottomnavBarState();
}

class _BottomnavBarState extends State<BottomnavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Quiz(),
    NewsApi(),
    ChatBot(),
    LogoApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.graduation_cap,
                    text: 'Quiz',
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'News',
                  ),
                  GButton(
                    icon: LineIcons.comment,
                    text: 'ChatBot',
                  ),
                  GButton(
                    icon: LineIcons.home,
                    text: 'DashBoard',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
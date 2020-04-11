import 'package:flutter_localization_master/pages/quizPages.dart';

import 'BasicHomePage.dart';
import 'chatBot.dart';
import 'grid.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'newsapi.dart';

class mainBoard extends StatefulWidget{
@override
_mainBoard createState() => _mainBoard();
}

class _mainBoard extends State<mainBoard>{
  int pageIndex =0;
  int _currentIndex=0;
  final List<Widget> _children =[
    Quiz(),
    NewsApi(),
    CarouselDemo(),
    ChatBot(),
    DashBoard(),
  ];
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    body:_children[_currentIndex],
     appBar: AppBar(
      //  leading: Image(image: AssetImage('image/Corona.png'),),
     backgroundColor: Colors.white,
     title:Text("Fight against COVID19",
     style: TextStyle(color: Colors.black),
     textAlign: TextAlign.center,),
     ),

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
     
      height: 50,
      
      items: <Widget>[
        
        Icon(Icons.update,size: 20,color: Colors.black),
        Icon(Icons.tv,size: 20,color: Colors.black),
        Icon(Icons.home,size: 20,color: Colors.black),
        Icon(Icons.chat,size: 20,color: Colors.black),
        Icon(Icons.dashboard,size: 20,color: Colors.black),
      ],
      animationDuration: Duration(
        milliseconds: 200
      ),
      onTap: onTappedBar,
      // index: 2,
      animationCurve: Curves.bounceInOut,
    ),

  );
}

  void onTappedBar(int index) {
    setState(() {
      
      _currentIndex=index;
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
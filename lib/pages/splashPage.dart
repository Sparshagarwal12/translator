import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/LanguagePage.dart';
import 'package:flutter_localization_master/router/route_constants.dart';

class SplashPage extends StatefulWidget{
  @override
  State createState() {
    // TODO: implement createState
    return SplashState();
  }


}
class SplashState extends State{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,homeRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(

          //child: Future.delayed(Duration(seconds: 2),(){});
          child: Image.asset("assets/logo/splash.jpg",fit: BoxFit.contain,),

        ));
  }
}
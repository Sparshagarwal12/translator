import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';

List<Color> color1 = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];
List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 50),
              Center(
                  child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => chatBot(context)),
                        );
                      },
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: color1,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 15.0,
                                  offset: Offset.fromDirection(1.0, 10.0))
                            ],
                          ),
                          margin: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Image(image: AssetImage('images/chatbot.png')),
                                Text(
                                  // getTranslated(context, ;)
                                  "CHATBOT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ))),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => autoCheck(context)));
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: color1,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset.fromDirection(1.0, 10.0))
                          ],
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Image(
                                    image: AssetImage('images/auto_chekc.png')),
                                Text(
                                  "AUTOCHECKER",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                )
                              ],
                            ))),
                  )
                ],
              )),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => dashboard(context)),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: color1,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 15.0,
                              offset: Offset.fromDirection(1.0, 10.0))
                        ],
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage('images/grid.png')),
                              Text(
                                "DASHBOARD",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => selfCheck(context)),
                      );
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: color1,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset.fromDirection(1.0, 10.0))
                          ],
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage('images/selfCheck.png')),
                              Text(
                                "SELF SERVICE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => mapper(context)),
                      );
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: color1,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset.fromDirection(1.0, 10.0))
                          ],
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Image(image: AssetImage('images/dataMapper.png')),
                              Text(
                                "DATA MAPPER",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => userSupport(context)),
                      );
                    },
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: color1,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 15.0,
                                offset: Offset.fromDirection(1.0, 10.0))
                          ],
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Image(
                                  image: AssetImage('images/userSupport.png')),
                              SizedBox(height: 10),
                              Text(
                                "USER SUPPORT",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  // SingleChildScrollView(
                  Container(
                    height: 550,
                    width: 3000,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF90F7EC),
                              Color(0xFF32CCBC),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "About App",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(
                              getTranslated(context, 'about_app'),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

Widget chatBot(BuildContext context) {
  return Scaffold(
      // appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_chatBot'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

Widget autoCheck(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_autochecker'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

Widget dashboard(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_dashBoard'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

Widget selfCheck(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_self_service'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

Widget mapper(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_dataMapper'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

Widget userSupport(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("India's Fight Against Corona")),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('images/android.png')),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: color2,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 15.0,
                        offset: Offset.fromDirection(1.0, 10.0))
                  ],
                ),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    getTranslated(context, 'about_userSupport'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ))
          ])));
}

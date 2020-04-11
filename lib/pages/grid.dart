import 'dart:convert';

// import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/pages/tracker.dart';

import 'dashBoardGoogleMap.dart' as dash;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ministrystate.dart';
import 'dashBoardStates.dart' as dash;
import 'selfchecker.dart';
import 'package:flutter/material.dart';
import 'pointClass.dart' as point;
import 'package:http/http.dart' as http;
import 'tracker.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

Future<Map> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/accounts/aggregates";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class _DashBoard extends State<DashBoard> with SingleTickerProviderStateMixin {
  Animation<double> animation, animation2;
  AnimationController _controller, _controller2;
  String i;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation objects value
          i = animation.value.toStringAsFixed(0);
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("asdsad")),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFFFF9933),
                  Color(0xFFFFFFFF),
                  Color(0xFF138808),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: FutureBuilder(
                  future: getUri(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      Map content = snapshot.data;
                      return ListView(children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      elevation: 10.0,
                                      color: Color(0xFFFFFFFF),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              content["registered"].toString(),
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 50,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Center(
                                              child: Text(
                                                // "कुल उपयोगकर्ता रजिस्टर",
                                                getTranslated(
                                                    context, 'total_register'),
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      margin: EdgeInsets.only(left: 10),
                                    )),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  content["infected"]
                                                      .toString(),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "कुल संक्रमित व्यक्ति",
                                                    getTranslated(context,
                                                        'total_infected'),
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    dash.stateList(
                                                        para: "is_infected")),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  content["symptoms"]
                                                      .toString(),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "संदिग्ध मामला",
                                                    getTranslated(
                                                        context, 'suspected'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    dash.stateList(
                                                      para: "symptoms",
                                                    )),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  content["recovered"]
                                                      .toString(),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "कुल व्यक्ति ठीक हो गया",
                                                    getTranslated(
                                                        context, 'total_cured'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.secondgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '$i',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        fontSize: 50,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      // "कुल मौत",
                                                      getTranslated(context,
                                                          'total_death'),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.secondgrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '$i',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "कुल लोगों को अलग कर दिया",
                                                    getTranslated(
                                                        context, 'total_cured'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.secondgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '$i',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "कुल लोग बरामद",
                                                    getTranslated(context,
                                                        'total_isolated'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.secondgrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/hospital.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nअस्पताल",
                                                    getTranslated(
                                                        context, 'hospital'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.hospitalgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/headset.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nहेल्पलाइन",
                                                    "\n"+getTranslated(
                                                        context, 'helpline'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.helpgrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/lab_items.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nपरीक्षण प्रयोगशाला",
                                                   "\n"+getTranslated(context, 'testing_labs'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.labgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/blackspot.png')),
                                                Center(
                                                  child: Text(
                                                    // "मानचित्र ",
                                                 "\n"+   getTranslated(
                                                        context, 'blackspot'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  point.blackgrid(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                  image: AssetImage(
                                                      'images/youtube.png'),
                                                ),
                                                Center(
                                                  child: Text(
                                                    // "\nवीडियो",
                                                 "\n"+   getTranslated(
                                                        context, 'video'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.videogrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/ministry.png')),
                                                Center(
                                                  child: Text(
                                                    // "स्वास्थ्य मंत्रालय",
                                                    getTranslated(context,
                                                        'health_ministry'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    stateList()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/warning.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nसावधानियां",
                                                  "\n"+  getTranslated(
                                                        context, 'precaution'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.secondgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/aware.png')),
                                                Center(
                                                  child: Text(
                                                    // "जागरूकता",
                                                    getTranslated(
                                                        context, 'awareness'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.awaregrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/advice.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nसलाहकार",
                                                  "\n"+  getTranslated(
                                                        context, 'advisory'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.advicegrid()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/faq.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nसामान्य प्रश्न",
                                                 "\n"+   getTranslated(
                                                        context, 'faq'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.faqgrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/audio.png')),
                                                Center(
                                                  child: Text(
                                                    // "ऑडियो नमूना",
                                                getTranslated(context,
                                                        'audio_sample'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.audiogrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/selfcheck.png')),
                                                Center(
                                                  child: Text(
                                                    // "स्वयं जाँचकर्ता",
                                                    getTranslated(context,
                                                        'self_checker'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    selfcheck2()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/virus.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nकोरोना ट्रैकर",
                                               "\n"+     getTranslated(context,
                                                        'corona_tracker'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Tracker()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/require.png')),
                                                Center(
                                                  child: Text(
                                                    // "लोगों की जरुरत",
                                                    getTranslated(context,
                                                        'user_requrirement'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.usergrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image(
                                                    image: AssetImage(
                                                        'images/inform.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nअन्य व्यक्ति की जानकारी",
                                                  "\n"+  getTranslated(
                                                        context, 'people_info'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.infogrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                // Image(
                                                //     image: AssetImage(
                                                //         'images/file.png')),
                                                Center(
                                                  child: Text(
                                                    // "\nबाहरी स्रोत से डेटा",
                                                   "\n"+ getTranslated(context,
                                                        'external_soc'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.outgrid()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 10.0,
                                          color: Color(0xFFFFFFFF),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                // Image(
                                                //     image: AssetImage(
                                                //         'images/elab.png')),
                                                Center(
                                                  child: Text(
                                                    // "बाहरी स्रोत से परीक्षण केंद्र डेटा",
                                                    getTranslated(
                                                        context, 'external_lab'),
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    point.exterTestgrid()),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        )
                      ]);
                    } else {
                      return Center(
                        child: SpinKitChasingDots(
                          color: Colors.black,
                          size: 50.0,
                        ),
                      );
                    }
                  },
                ))));
  }
}

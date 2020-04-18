import 'dart:convert';

import 'package:flutter_localization_master/pages/DailyBasis.dart';
// import 'package:flutter_localization_master/pages/HomeCreate.dart';
import 'package:line_icons/line_icons.dart';

import 'ministrystate.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'selfchecker.dart';
import 'package:flutter/foundation.dart';
import 'pointClass.dart' as point;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tracker.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

Future<Map> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/accounts/aggregates";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse(); 
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Center(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: FutureBuilder(
              future: getUri(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map content = snapshot.data;
                  return AnimationConfiguration.staggeredList(
                    position: 1,
                    duration: const Duration(milliseconds: 1075),
                    child: SlideAnimation(
                      verticalOffset: 150.0,
                      child: FadeInAnimation(
                        child: ListView(children: <Widget>[
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
                                      Cont(
                                        end: content['registered'].toDouble(),
                                        text: getTranslated(
                                            context, 'total_register'),
                                        // "कुल उपयोगकर्ता रजिस्टर"
                                      ),
                                      Cont(
                                        end: content['infected'].toDouble(),
                                        text: getTranslated(
                                            context, 'total_infected'),
                                        //  "कुल संक्रमित व्यक्ति"
                                      ),
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
                                      Cont(
                                        end: content['symptoms'].toDouble(),
                                        text:
                                            getTranslated(context, 'suspected'),
                                        // "संदिग्ध मामलाा"
                                      ),
                                      Cont(
                                          end: 7.0,
                                          text: getTranslated(
                                              context, 'total_cured')
                                          // "कुल व्यक्ति ठीक हो गया"
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
                                      Cont(
                                          end: 3.0,
                                          text: getTranslated(
                                              context, 'total_death')
                                          //  "कुल मौत"
                                          ),
                                      Cont(
                                          end: 3.0,
                                          text: getTranslated(
                                              context, 'total_isolated')
                                          // "कुल लोगों को अलग कर दिया"
                                          )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Cont(end: 2.0, text: "कुल लोग बरामद"),
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                            scale: _scale,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
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
                                                    Icon(LineIcons.hospital_o,
                                                        size: 60),
                                                    Center(
                                                      child: Text(
                                                        getTranslated(context,
                                                            'hospital'),
                                                        // "\nअस्पताल",
                                                        textAlign:
                                                            TextAlign.center,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                            ),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
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
                                                  Icon(
                                                    LineIcons.phone,
                                                    size: 60,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      // "\nहेल्पलाइन",
                                                      getTranslated(
                                                          context, 'helpline'),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
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
                                                        point.helpgrid()));
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.flask,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'testing_labs'),
                                                          // "\nपरीक्षण प्रयोगशाला",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.map_marker,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'blackspot'),
                                                          // "मानचित्र ",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
                                          onTap: () {},
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.youtube_play,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(
                                                              context, 'video'),
                                                          // "\nवीडियो",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(LineIcons.heart_o,
                                                          size: 60.0),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'health_ministry'),
                                                          // "स्वास्थ्य मंत्रालय",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.shield,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'precaution'),
                                                          // "\nसावधानियां",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      point.precautiongrid()),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                            scale: _scale,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
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
                                                    Icon(
                                                      LineIcons.warning,
                                                      size: 60.0,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        getTranslated(context,
                                                            'awareness'),
                                                        // "जागरूकता",
                                                        textAlign:
                                                            TextAlign.center,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                            ),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.commenting,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'advisory'),
                                                          // "\nसलाहकार",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      point.advicegrid()
                                                  // LocalAudio(),
                                                  ),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons
                                                            .question_circle,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          "\n" +
                                                              getTranslated(
                                                                  context,
                                                                  'faq'),
                                                          // "\nसामान्य प्रश्न",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(LineIcons.microphone,
                                                          size: 60.0),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'audio_sample'),
                                                          // "ऑडियो नमूना",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                          LineIcons
                                                              .arrow_circle_up,
                                                          size: 60.0),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'self_checker'),
                                                          // "स्वयं जाँचकर्ता",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      checker()),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image(
                                                          image: AssetImage(
                                                              'images/virus.png')),
                                                      Center(
                                                        child: Text(
                                                          "\n" +
                                                              getTranslated(
                                                                  context,
                                                                  'corona_tracker'),
                                                          // "\nकोरोना ट्रैकर",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.user,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'user_requrirement'),
                                                          // "लोगों की जरुरत",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18.0,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.list,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          getTranslated(context,
                                                              'people_info'),
                                                          // "\nअन्य व्यक्ति की जानकारी",
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        LineIcons.database,
                                                        size: 60.0,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                          // "\nबाहरी स्रोत से डेटा",
                                                          // "\n" +
                                                          getTranslated(context,
                                                              'external_soc'),
                                                          textAlign:
                                                              TextAlign.center,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18.0,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
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
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                            scale: _scale,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
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
                                                            'images/elab.png')),
                                                    Center(
                                                      child: Text(
                                                        // "बाहरी स्रोत से परीक्षण केंद्र डेटा",
                                                        getTranslated(context,
                                                            'external_lab'),
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
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                            ),
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
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                            scale: _scale,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
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
                                                        "Daily Basis",
                                                        // "\n" +
                                                        // getTranslated(context,
                                                        //     'external_soc'),
                                                        textAlign:
                                                            TextAlign.center,
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
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DailyBasis()),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTapDown: _onTapDown,
                                          onTapUp: _onTapUp,
                                          child: Transform.scale(
                                              scale: _scale,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                                elevation: 10.0,
                                                color: Color(0xFFFFFFFF),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      // Image(
                                                      //     image: AssetImage(
                                                      //         'images/elab.png')),
                                                      Center(
                                                        child: Text(
                                                          "About App",
                                                          // getTranslated(context,
                                                          //     'external_lab'),
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
                                                  ),
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                              )),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>//GoHome()),
                                                      point.exterTestgrid()),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: SpinKitChasingDots(
                        color: Colors.black,
                        size: 80.0,
                      ),
                    ),
                  );
                }
              },
            )));
  }
}

class Cont extends StatefulWidget {
  final double end;
  final String text;

  const Cont({Key key, this.end, this.text}) : super(key: key);

  @override
  _ContState createState() => _ContState();
}

class _ContState extends State<Cont> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;
  String i = "0";

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween<double>(begin: 0, end: widget.end).animate(_controller)
      ..addListener(() {
        setState(() {
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
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
            colors: [Colors.orange[300], Colors.white, Colors.green[200]],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
              color: Colors.black45,
              blurRadius: 10.0,
              offset: Offset.fromDirection(4.5, -5.0))
        ],
      ),
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$i',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: 50,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          Center(
            child: Text(
              '${widget.text}',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter_localization_master/localization/language_constants.dart';

import 'grid.dart';
import 'majorend.dart';
import 'ownchecker3.dart';
import 'selfchecker.dart';
import 'selfchecker3.dart';
import 'slefDeclaration.dart';
import 'package:flutter/material.dart';

class majorchecker extends StatefulWidget {
  @override
  _majorchecker createState() => _majorchecker();
}

class _majorchecker extends State<majorchecker> {
  int _radioValue;
  void _handleRadio(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  List<String> users = ["Hospital", "Citizen"];
  String text;
  String selectedUser;
  TextEditingController emailEditor = new TextEditingController();
  TextEditingController passEditor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF3180e4),
                    Color(0xFF564dc2),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  color: Colors.white,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Image(image: AssetImage('images/forindia.gif')),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11,
                    ),
                    Center(
                      child: Container(
                        //padding: EdgeInsets.only(bottom: 100),
                        width: 300,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 10.0,
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 15.0, left: 10.0, right: 10.0),
                            child: ListView(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    // getTranslated(context, 'key'),
                                    "क्या आपको इनमें से कोई बड़ी समस्या है",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 0,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text(
                                          getTranslated(context, 'own_major1'),
                                          // "पुरानी फेफड़ों की बीमारी"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 1,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text(
                                          getTranslated(context, 'own_major2'),
                                          // "गंभीर दिल की स्थिति"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 2,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text(
                                          getTranslated(context, 'own_major3'),
                                          // "कैंसर का उपचार"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 3,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text("गंभीर मोटापा")
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 4,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text(
                                          getTranslated(context, 'own_major4'),
                                          // "मधुमेह"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                            value: 5,
                                            groupValue: _radioValue,
                                            onChanged: _handleRadio),
                                        Text("गुर्दे की विफलता")
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 21,
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF426bd7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26, blurRadius: 10.0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (_radioValue >= 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              selfmajorLast()));
                                }
                              },
                              child: Text(
                                // "आगे >>>",
                                getTranslated(context, 'next'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class selfmajorLast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("कोरोना के खिलाफ भारत की लड़ाई")),
        body: majorLast());
  }
}

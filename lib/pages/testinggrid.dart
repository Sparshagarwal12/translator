import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'testingCentre.dart';

class testinggrid1 extends StatefulWidget {
  @override
  _testinggrid1 createState() => _testinggrid1();
}

class _testinggrid1 extends State<testinggrid1>
    with SingleTickerProviderStateMixin {
  String i;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFFF9933),
              Color(0xFFFFFFFF),
              Color(0xFF138808),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TestingCentre(
                                            para: "TC",
                                          )),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                elevation: 10.0,
                                color: Color(0xFFFFFFFF),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                          image:
                                              AssetImage('images/center.png')),
                                      Center(
                                        child: Text(
                                          getTranslated(
                                              context, 'testing_center'),
                                          // "परीक्षण केंद्र",
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.ltr,
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
                              ))),
                      Expanded(
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 10.0,
                            color: Color(0xFFFFFFFF),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(image: AssetImage('images/pcr.png')),
                                  Center(
                                    child: Text(
                                      getTranslated(context, 'pcr'),
                                      // "पीसीआर मशीन",
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                                  builder: (context) => TestingCentre(
                                        para: "PR",
                                      )),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestingCentre(
                                      para: "SC",
                                    )),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          elevation: 10.0,
                          color: Color(0xFFFFFFFF),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage('images/sample.png')),
                                Center(
                                  child: Text(
                                    getTranslated(context, 'sample_coll'),
                                    // "नमूना संग्रह",
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.ltr,
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
                        ),
                      )),
                      Expanded(
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 10.0,
                            color: Color(0xFFFFFFFF),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(image: AssetImage('images/inform.png')),
                                  Center(
                                    child: Text(
                                      getTranslated(context, 'guidlines'),
                                      // "\nदिशा निर्देशों",
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => secondgrid()),
                            // );
                          },
                        ),
                      ),
                    ],
                  ))
            ])));
  }
}
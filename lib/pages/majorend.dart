import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/pages/MyHomePage.dart';

import 'grid.dart';
import 'package:flutter/material.dart';

class majorLast extends StatefulWidget {
  @override
  _majorLast createState() => _majorLast();
}

class _majorLast extends State<majorLast> {
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
              child: Padding(
                //alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 150),
                child: Center(
                  child: Stack(
                    children: <Widget>[
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
                                      // "हमने आप में कोरोना के गंभीर लक्षण पाए हैं",
                                      getTranslated(context, 'symp_found'),
                                      style: TextStyle(fontSize: 30.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Column(children: <Widget>[
                                    Center(
                                      child: Text(
                                        // "1.अब 1075 पर कॉल करें। तत्काल चिकित्सा ध्यान देने की आवश्यकता है।",
                                        getTranslated(context, 'advice_1'),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        // "2.1075 हेल्पलाइन बताएं कि क्या आप COVID-19 के साथ किसी के संपर्क में हैं या यदि आप हाल ही में किसी ऐसे क्षेत्र में गए हैं जहां COVID-19 फैल रहा है।",
                                       getTranslated(context, 'advice_2'),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ])
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 390.0),
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
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BottomnavBar()),
                                        (Route<dynamic> route) => false);

                                    // else{
                                    //    Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               warn()));
                                    // }
                                  },
                                  child: Text(
                                    // "मुख्य मेनू पर जाएं >>>",
                                    getTranslated(context, 'main_menu'),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

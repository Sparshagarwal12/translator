import 'package:flutter/material.dart';
// import 'chart1.dart';
import 'outerstate.dart';
// import 'outerstate.dart';
import 'timeseries.dart';

class OtherSource extends StatelessWidget {
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
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: Image(image: AssetImage('images/flag.gif')),
                ),
                Padding(
                  padding: EdgeInsets.all(80),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 10.0,
                            color: Color(0xFFFFFFFF),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage('images/list.png')),
                                      Center(
                                        child: Text(
                                          "\nGet Info From Bank",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize: 25,
                                              // color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => outstateRoute()),
                            // );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            elevation: 10.0,
                            color: Color(0xFFFFFFFF),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage('images/time.png')),
                                      Center(
                                        child: Text(
                                          "\nFarmer Grid",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize: 25,
                                              // color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => timeRoute()),
                            // );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

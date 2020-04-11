// import 'searchPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalTest extends StatefulWidget {
  @override
  _ExternalTest createState() => _ExternalTest();
}

Future<Map> getUri() async {
  String url = "https://api.covid19india.org/data.json";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

List<Color> color1 = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];
List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];

Route createRoute(Widget name) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutQuad;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

double width;
double height;

class _ExternalTest extends State<ExternalTest> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: FutureBuilder(
            future: getUri(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                Map content = snapshot.data;
                // print(content['cases_time_series'].length);
                // for (int i = 0; i < content.length; i++) {
                //   if (!states.contains(content[i]["state"])) {
                //     states.add(content[i]["state"]);
                //   }
                // }
                // states.sort((a, b) => a.toString().compareTo(b.toString()));

                return ListView.builder(
                  itemCount: content['tested'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => timeDetails(
                                          content['tested'][index]
                                              ["updatetimestamp"])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: index % 2 == 0 ? color1 : color2,
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
                              width: 300,
                              height: 80,
                              child: Center(
                                  child: Text(
                                content['tested'][index]["updatetimestamp"],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: SpinKitChasingDots(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              }
            }),
      ),
    );
  }
}

Widget timeDetails(var date) {
  return Scaffold(
    appBar: AppBar(
      title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
    ),
    body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: FutureBuilder(
          future: getUri(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Map content = snapshot.data;
              return ListView.builder(
                itemCount: content['tested'].length,
                itemBuilder: (BuildContext context, int index) {
                  if (content['tested'][index]["updatetimestamp"] == date) {
                    return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Image(image: AssetImage('images/flag.gif')),
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors:  color1,
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
                            // width: 300,
                            // height: 80,
                            child: Center(
                                child: Padding(padding:EdgeInsets.only(left:10), 
                                child:Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "\nTotal Individuals Tested: " +
                                        content['tested'][index]
                                                ["totalindividualstested"]
                                            .toString(),
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "\nTotal Positive Cases: " +
                                        content['tested'][index]
                                                ["totalpositivecases"]
                                            .toString(),
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "\nUpdate Time: " +
                                        content['tested'][index]
                                                ["updatetimestamp"]
                                            .toString(),
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "\nTotal Samples Tested: " +
                                        content['tested'][index]
                                                ["totalsamplestested"]
                                            .toString() +
                                        "\n",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ))),
                          ),
                        ]));
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Center(
                child: SpinKitChasingDots(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
          },
        )),
  );
}

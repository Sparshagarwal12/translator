// import 'searchPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => timeDetails(
                                    content['tested'][index]
                                        ["updatetimestamp"])));
                      },
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 10.0)
                            ]),
                        child: Center(
                            child: Text(
                          content['tested'][index]["updatetimestamp"],
                          style: TextStyle(fontSize: 20.0),
                        )),
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                    ),
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
                          Card(
                            elevation: 10,
                            child: Center(
                                child: Column(
                              children: <Widget>[
                                Text(
                                  "\nTotal Individuals Tested: " +
                                      content['tested'][index]
                                              ["totalindividualstested"]
                                          .toString(),
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "\nTotal Positive Cases: " +
                                      content['tested'][index]
                                              ["totalpositivecases"]
                                          .toString(),
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "\nUpdate Time: " +
                                      content['tested'][index]
                                              ["updatetimestamp"]
                                          .toString(),
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "\nTotal Samples Tested: " +
                                      content['tested'][index]
                                              ["totalsamplestested"]
                                          .toString() +
                                      "\n",
                                  style: TextStyle(fontSize: 20.0),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )),
                          ),
                        ]));
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                ),
              );
            }
          },
        )),
  );
}

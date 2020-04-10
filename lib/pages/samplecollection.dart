import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class sampleCollection extends StatefulWidget {
  @override
  _sampleCollection createState() => _sampleCollection();
}

Future<List<dynamic>> getUri() async {
  String url =
      "https://covid-mitrc.herokuapp.com/accounts/testing-center?search=SC";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

double width;
double height;
var string;
List<String> states = [];
// List<int> centres = [];

class _sampleCollection extends State<sampleCollection> {
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
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FutureBuilder(
            future: getUri(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List content = snapshot.data;
                for (int i = 0; i < content.length; i++) {
                  if (!states.contains(content[i]["state"])) {
                    states.add(content[i]["state"]);
                  }
                }

                states.sort((a, b) => a.toString().compareTo(b.toString()));
                return ListView.builder(
                  itemCount: states.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    pcrDetails(states[index])));
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
                          states[index],
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
                      strokeWidth: 3,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}

Widget pcrDetails(String state) {
  return Scaffold(
    appBar: AppBar(
      title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
    ),
    body: Container(
        width: width,
        height: height,
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
              List content = snapshot.data;
              return ListView.builder(
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  if (content[index]["state"] == state) {
                    if (content[index]["is_operational"] == true) {
                      string = "Yes";
                    } else {
                      string = "No";
                    }
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      //height: 100.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Text(
                            content[index]["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "\nDetails:-",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            content[index]["detail"],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "District: " + content[index]["district"],
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Type: " + content[index]["type"],
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Operational: " + string,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              "State: " + content[index]["state"],
                              style: TextStyle(fontSize: 18.0),
                            ),
                        ),
                        ],
                      ),
                    );
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

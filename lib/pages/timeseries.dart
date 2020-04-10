import 'searchPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class TimeSeries extends StatefulWidget {
  @override
  _TimeSeries createState() => _TimeSeries();
}

Future<Map> getUri() async {
  String url = "https://api.covid19india.org/data.json";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

double width;
double height;

class _TimeSeries extends State<TimeSeries> {
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
                  itemCount: content['cases_time_series'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => timeDetails(
                                    content['cases_time_series'][index]
                                        ["date"])));
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
                          content['cases_time_series'][index]["date"],
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
      title: Text("कोविड-19"),
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
                itemCount: content['cases_time_series'].length,
                itemBuilder: (BuildContext context, int index) {
                  if (content['cases_time_series'][index]["date"] == date) {
                    return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Image(image: AssetImage('images/flag.gif')),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Data on:- " + date,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Card(
                            elevation: 10,
                            child: Center(
                                child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "\nDaily Confirmed Cases: " +
                                            "\t\t" +
                                            content['cases_time_series'][index]
                                                    ["dailyconfirmed"]
                                                .toString(),
                                        style: TextStyle(fontSize: 20.0),
                                        textAlign: TextAlign.left,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\nDaily Deceased: " +
                                          "\t\t" +
                                          content['cases_time_series'][index]
                                                  ["dailydeceased"]
                                              .toString(),
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\nDaily Recovered Cases: " +
                                          "\t\t" +
                                          content['cases_time_series'][index]
                                                  ["dailyrecovered"]
                                              .toString(),
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\nDate: " +
                                          "\t\t" +
                                          content['cases_time_series'][index]
                                                  ["date"]
                                              .toString(),
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "\nTotal Confirmed Cases: " +
                                              "\t\t" +
                                              content['cases_time_series']
                                                      [index]["totalconfirmed"]
                                                  .toString(),
                                          style: TextStyle(fontSize: 20.0),
                                          textAlign: TextAlign.start,
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\nTotal Deceased Cases: " +
                                          "\t\t" +
                                          content['cases_time_series'][index]
                                                  ["totaldeceased"]
                                              .toString(),
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "\nTotal Recovered Cases: " +
                                            "\t\t" +
                                            content['cases_time_series'][index]
                                                    ["totalrecovered"]
                                                .toString() +
                                            "\n",
                                        style: TextStyle(fontSize: 20.0),
                                        textAlign: TextAlign.start,
                                      )),
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/DeclarationForm.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class vrdl extends StatefulWidget {
  @override
  _vrdl createState() => _vrdl();
}

Future<List<dynamic>> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/accounts/hospital";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

double width;
double height;
var string;
List<String> states = [];
List<String> district = [];

class _vrdl extends State<vrdl> {
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
                                    vrdlDetails(states[index])));
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

Widget vrdlDetails(String sttte) {
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
              for (int i = 0; i < content.length; i++) {
                if (content[i]["state"] == sttte) {
                  if (!district.contains(content[i]["district"])) {
                    district.add(content[i]["district"]);
                  }
                }
              }
              district.sort((a, b) => a.toString().compareTo(b.toString()));

              // List content = snapshot.data;
              return ListView.builder(
                  itemCount: district.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(child: Text(district[index].toString()));
                  });
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

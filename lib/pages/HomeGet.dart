import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/googlemaps.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

Future<List<dynamic>> getUri() async {
  String url = "http://covid-mitrc.herokuapp.com/apis/home";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];

TextEditingController adh = new TextEditingController();

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          TextFormField(
            obscureText: false,
            controller: adh,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Aadhar",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 50),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => getData(adh.text)),
              );
            },
            child: Center(child: Text("Submit")),
          )
        ],
      )),
    );
  }
}

Widget getData(var data) {
  int dat = int.parse(data);
  return Scaffold(
      body: Container(
          child: FutureBuilder(
              future: getUri(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List content = snapshot.data;
                  return ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (content[index]["aadhar"] == dat) {
                          return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: color2,
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
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Aadhar Number:\t\t" +
                                          content[index]["aadhar"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Name:\t\t" + content[index]["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Address:\t\t" +
                                              content[index]["address"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "District:\t\t" +
                                              content[index]["district"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "To District:\t\t" +
                                            content[index]["to_district"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "From State:\t\t" +
                                            content[index]["from_state"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Journey Date:\t\t" +
                                            content[index]["date_of_journey"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Reason:\t\t" +
                                            content[index]["reason"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Is Approved:\t\t" +
                                            content[index]["is_approved"]
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Approval Date:\t\t" +
                                            content[index]["approval_date"]
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Have Infected:\t\t" +
                                            content[index]["have_infected"]
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Have Tested:\t\t" +
                                            content[index]["have_tested"]
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ],
                              ));
                        } else {
                          return SizedBox(height: 0.0);
                        }
                      });
                } else {
                  return Container();
                }
              })));
}

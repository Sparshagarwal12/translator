import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/DeclarationForm.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<dynamic>> getUri(String a) async {
  String url = 'https://covid-mitrc.herokuapp.com/apis/daily-basis?search=${a}';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

Future<List<dynamic>> getUri2() async {
  String url = 'https://covid-mitrc.herokuapp.com/apis/daily-basis';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

// BuildContext context;
List<String> districtList = [];
String abs;

List<Color> color1 = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];

class DailyBasis extends StatefulWidget {
  @override
  _DailyBasis createState() => _DailyBasis();
}

class _DailyBasis extends State<DailyBasis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("India's Fight Agaist Corona")),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFFF9933),
          Color(0xFFFFFFFF),
          Color(0xFF138808),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FutureBuilder(
            future: getUri2(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List content = snapshot.data;
                for (int i = 0; i < content.length; i++) {
                  if (!districtList.contains(content[i]["district"])) {
                    districtList.add(content[i]["district"]);
                  }
                }
                return Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Image(image: AssetImage('images/flag.gif')),
                    SizedBox(height: 80),
                    Card(
                        child: DropdownButton<String>(
                      underline: SizedBox(),
                      hint: Text("\tSelect State"),
                      onChanged: (String language) {
                        // _changeLanguage(language);
                        abs = language;
                        Text("data");
                      },
                      items: districtList
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )),
                    SizedBox(
                      height:30
                    ),
                    Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF426bd7),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 10.0)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => getDaily(abs)));
                          // Fluttertoast.showToast(
                          //     msg: abs.toString(), toastLength: Toast.LENGTH_SHORT);
                        },
                        child: Text(
                          "Submit",
                          // getTranslated(context, 'login'),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ));
              }
            }),
      ),
    );
  }
}

Widget getDaily(String data) {
  return Scaffold(
    appBar: AppBar(title: Text("India's Fight Against Corona")),
    body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFFF9933),
          Color(0xFFFFFFFF),
          Color(0xFF138808),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: FutureBuilder(
            future: getUri(data),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List content = snapshot.data;
                print(snapshot.data);
                return ListView.builder(
                    itemCount: content.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (content[index]["district"] == data) {
                        return Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Image(image: AssetImage('images/flag.gif')),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: color1,
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
                                margin: EdgeInsets.all(15.0),
                                // width: 300,
                                // height: 110,
                                child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tState:\t" +
                                                  content[index]["state"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tDistrict:\t" +
                                                  content[index]["district"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tArea:\t" +
                                                  content[index]["area"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "\tWard:\t" +
                                                content[index]["ward"],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tDate:\t" +
                                                  content[index]["date"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tAuthority:\t" +
                                                  content[index]["authority"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tContact:\t" +
                                                  content[index]["contact"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tPost:\t" +
                                                  content[index]["post"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tFood:\t" +
                                                  content[index]["food"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tVegetable:\t" +
                                                  content[index]["vegetable"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tRation:\t" +
                                                  content[index]["ration"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tFarmer:\t" +
                                                  content[index]["farmer"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                "\tMilk:\t" +
                                                    content[index]["milk"],
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                                textAlign: TextAlign.right)),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tOther:\t" +
                                                  content[index]["other"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.left,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tAnnouncement:\t" +
                                                  content[index]
                                                      ["announcement"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                        SizedBox(height: 10),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\tRemarks:\t" +
                                                  content[index]["remarks"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                              textAlign: TextAlign.start,
                                            )),
                                      ],
                                    )))
                          ],
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Container();
              }
            })),
  );
}

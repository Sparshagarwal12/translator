import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/DeclarationForm.dart';
import 'package:http/http.dart' as http;

class PatientReport extends StatefulWidget {
  @override
  _PatientReport createState() => _PatientReport();
}

Future<dynamic> Report() async {
  String url = 'http://hospital-covid.herokuapp.com/api/patient=${9941}';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

// TextEditingController ctr;
var aadhar = 9941;

class _PatientReport extends State<PatientReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFFF9933),
        Color(0xFFFFFFFF),
        Color(0xFF138808),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: FutureBuilder(
          future: Report(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List content = snapshot.data;
              return ListView.builder(
                  itemCount: content.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                content[index],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ))),
                    );
                  });
            } else {
              return Container();
            }
          }),
    );
  }
}

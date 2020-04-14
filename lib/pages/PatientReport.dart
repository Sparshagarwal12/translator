import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

Future<Map> getUri(int a) async {
  String url = "https://hospital-covid.herokuapp.com/api/patient/$a";
  http.Response response = await http.get(url);
  // var sa = json.encode(response.body);
  return json.decode(response.body);
}

// class Album {
//   final String status;
//   final int id;
//   final String come_by;

//   Album({this.status, this.id, this.come_by});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       status: json['status'],
//       id: json['id'],
//       come_by: json['come_by'],
//     );
//   }
// }

var data;
TextEditingController mobEditor = new TextEditingController();

class PatientReport extends StatefulWidget {
  PatientReport({Key key}) : super(key: key);

  @override
  _PatientReport createState() => _PatientReport();
}

TextEditingController adhharEditor = new TextEditingController();

class _PatientReport extends State<PatientReport> {
  // Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("India's Fight against Corona")),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFFF9933),
              Color(0xFFFFFFFF),
              Color(0xFF138808),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('images/flag.gif')),
                SizedBox(
                  height:30
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all( 20),
                    child: TextFormField(
                      obscureText: false,
                      controller: mobEditor,
                      keyboardType: TextInputType.number,
                      // controller: passEditor,
                      decoration: InputDecoration(
                        labelText: "Aadhar Number",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                    child:
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
                    var data = mobEditor.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => fetchDetail(data)));
                  },
                        child: Text(
                          "Submit",
                          // getTranslated(context, 'login'),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ],
            )));
  }
}

Widget fetchDetail(var data) {
  var et = int.parse(data);
  return Center(
    child: FutureBuilder(
      future: getUri(et),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        // print(snapshot.data.status);
        if (snapshot.hasData) {
          print(snapshot.data);
          Map content = snapshot.data;
          print(content);
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[Text(content["status"])],
                );
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(
          child: SpinKitChasingDots(
            color: Colors.black,
            size: 50.0,
          ),
        );
      },
    ),
  );
}

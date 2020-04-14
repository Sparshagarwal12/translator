import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_localization_master/pages/DeclarationForm.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/dashBoardStates.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<Map> getState(String a) async {
  String url = "https://hospital-covid.herokuapp.com/api?state=${a}";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getDistrict(String a) async {
  String url = "https://hospital-covid.herokuapp.com/api?district=${a}";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

var abs;
String selectedUser;
List<String> stateList = [
  "ANDAMAN & NICOBAR",
  "ANDHRA PRADESH",
  "ARUNANCHAL PRADESH",
  "ASSAM",
  "BIHAR",
  "CHANDIGARH",
  "CHATTISGARH",
  "DADAR & NAGAR HAVELI",
  "DELHI",
  "GOA",
  "GUJRAT",
  "HARYANA",
  "HIMACHAL PRADESH",
  "JAMMU & KASHMIR",
  "JHARKHAND",
  "KARNATAKA",
  "KERLA",
  "LAKSHWADEEP",
  "LEH LADAKH",
  "MAHARASHTRA",
  "MADHYA PRADESH",
  "MANIPUR",
  "MEGHALAYA",
  "MIZORAM",
  "NAGALAND",
  "ODISHA",
  "PUNDUCHERRY",
  "PUNJAB",
  "RAJASTHAN",
  "SIKKIM",
  "TAMIL NADU",
  "TELANGANA",
  "TRIPURA",
  "UTTAR PRADESH",
  "UTTARAKHAND",
  "WEST BENGAL",
];

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

var data;
TextEditingController mobEditor = new TextEditingController();

class HospitalList extends StatefulWidget {
  HospitalList({Key key}) : super(key: key);

  @override
  _HospitalList createState() => _HospitalList();
}

// BuildContext context;
TextEditingController adhharEditor = new TextEditingController();

class _HospitalList extends State<HospitalList> {
  // Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("asdas")),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
              child: Column(
            children: <Widget>[
              Image(image: AssetImage('images/flag.gif')),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => fetchState(context)));
                },
                child: Container(
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
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Text(
                        "OverAll StateWise Hospital Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => fetchDistrict(context)));
                },
                child: Container(
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
                    margin: EdgeInsets.all(10.0),
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Text(
                        "OverAll DistrictWise Hospital Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ))),
    );
  }
}

Widget fetchState(BuildContext context) {
  return Scaffold(
      body: Column(
    children: <Widget>[
      Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: TextFormField(
            obscureText: false,
            controller: mobEditor,
            // controller: passEditor,
            decoration: InputDecoration(
              labelText: "मोबाइल नंबर",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
        ),
      ),
      Center(
          child: MaterialButton(
        onPressed: () {
          var data = mobEditor.text;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => fetchDetail(data)));
        },
        child: Text("Submit"),
      ))
    ],
  ));
}

Widget fetchDetail(var data) {
  var fav = data.toString();
  return Scaffold(
    body: Center(
      child: FutureBuilder(
        future: getState(fav),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          // print(snapshot.data.status);
          if (snapshot.hasData) {
            print(snapshot.data);
            Map content = snapshot.data;
            print(content);
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: <Widget>[
                    Text(content["pending"].toString()),
                    Text(content["death"].toString()),
                    Text(content["discharged"].toString()),
                    Text(content["total"].toString()),
                    Text(content["positive"].toString()),
                    Text(content["negative"].toString()),
                    Text(content["admit"].toString()),
                  ]);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    ),
  );
}

Widget fetchDistrict(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("adakdmsad")),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('images/flag.gif'),
                ),
                SizedBox(height: 30),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Card(
                        child: DropdownButton<String>(
                      underline: SizedBox(),
                      hint: Text("\tSelect State"),
                      onChanged: (String language) {
                        // _changeLanguage(language);
                        abs = language;
                        Text("data");
                      },
                      items: stateList
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
                    // TextFormField(
                    //   obscureText: false,
                    //   controller: mobEditor,
                    //   // controller: passEditor,
                    //   decoration: InputDecoration(
                    //     labelText: "मोबाइल नंबर",
                    //     border: new OutlineInputBorder(
                    //       borderRadius: new BorderRadius.circular(5.0),
                    //       borderSide: new BorderSide(),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                Center(
                    child: Container(
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
                            // var data = mobEditor.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fetchDetail2(abs)));
                            // Fluttertoast.showToast(msg: abs.toString(),toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Text("Submit"),
                        )))
              ],
            ),
          )));
}

Widget fetchDetail2(var data) {
  var fav = data.toString();
  return Scaffold(
    body: Center(
      child: FutureBuilder(
        future: getDistrict(fav),
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
                    children: <Widget>[
                      Image(image: AssetImage('images/flag.gif')),
                      SizedBox(height: 30),
                      AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
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
                              // height: 100,
                              child: Center(
                                  child: Column(
                                children: <Widget>[
                                  Text(
                                    "Pending Cases:\t\t" +
                                        content["pending"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Death Cases:\t\t" +
                                        content["death"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Discharged Cases:\t\t" +
                                        content["discharged"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Total Cases:\t\t" +
                                        content["total"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Positive Cases:\t\t" +
                                        content["positive"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Negative Cases:\t\t" +
                                        content["negative"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Admit Cases:\t\t" +
                                        content["admit"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    ),
  );
}

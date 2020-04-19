import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

void makePost2(String a, String b, String c, String d, String e, String f,
    var g, String h) async {
  String url = "https://covid-mitrc.herokuapp.com/apis/neighbours/create";
  var body = {
    "rel": a,
    "name": b,
    "colony": c,
    "state": d,
    "district": e,
    "gender": h,
    "house": f,
    "mobile": g,
  };
  Response r = await post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: json.encode(body),
  );
  print(r.body);
}

List<Map<String, dynamic>> animCont = [
  {"color": color5, "shadow": Colors.deepOrange[300]},
  {"color": color5, "shadow": Colors.deepOrange[300]},
  {"color": color5, "shadow": Colors.deepOrange[300]},
  {"color": color5, "shadow": Colors.black54},
  {"color": color6, "shadow": Colors.black54},
  {"color": color6, "shadow": Colors.black54},
];

bool _value1 = false,
    _value2 = false,
    _value3 = false,
    _value4 = false,
    _value5 = false,
    _value6 = false,
    _value7 = false,
    _value8 = false;

List<Color> color6 = [
  Color(0xFFf80759),
  Color(0xFFbc4e9c),
];

List<Color> color3 = [
  Color(0xFF8E2DE2),
  Color(0xFF4A00E0),
];
List<Color> color1 = [
  Color(0xFF00b09b),
  Color(0xFF00b09b),
];
List<Color> color5 = [Color(0xFFFF5F6D), Color(0xFFFFC371)];
List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];
List<Color> color4 = [Color(0xFF36D1DC), Color(0xFF5B86E5)];

class Info extends StatefulWidget {
  @override
  _Info createState() => _Info();
}

class _Info extends State<Info> {
  List<String> dRajasthan = [
    "alwar",
    "jaipur",
    "bikaner",
    "jaisalmer",
    "bhilwara",
    "kota"
  ];

  String gender, relation;
  var valu, valu1, valu2;
  bool valu3 = false, valu4 = false, valu5 = false, valu6 = false;
  String selectedState;
  List<String> states = ["Rajasthan", "up", "Gujrat"];
  String selectedDistrict;
  int _radioValue, _radioValue2;
  TextEditingController nameEditor = new TextEditingController();
  TextEditingController mobEditor = new TextEditingController();
  TextEditingController colnyEditor = new TextEditingController();
  TextEditingController hnumberEditor = new TextEditingController();
  Position position;
  StreamSubscription<Position> positionStream;
  String lat, long = '';

  getLocation() async {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      // print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
      if (position != null) {
        setState(() {
          lat = position.latitude.toString();
          long = position.longitude.toString();
        });
      } else {
        setState(() {
          lat = 'लैट्इटयूड';
          long = 'लोंगीटूड ';
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lat = 'लैट्इटयूड';
    long = 'लोंगीटूड ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: AnimatedContainer(
                              curve: Curves.bounceInOut,
                              duration: Duration(milliseconds: 500),
                              height: 150,
                              child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Gender:",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                gender = "male";
                                                if (_value2 == false) {
                                                  setState(() {
                                                    _value1 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    _value1 = true;
                                                    _value2 = false;
                                                  });
                                                }
                                              },
                                              child: _value1 == false
                                                  ? AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.bounceInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[1]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Center(
                                                        child: Text(
                                                          "Male",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  : AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[5]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Icon(Icons.done),
                                                    )),
                                          GestureDetector(
                                              onTap: () {
                                                gender = "female";
                                                if (_value1 == false) {
                                                  setState(() {
                                                    _value2 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    _value2 = true;
                                                    _value1 = false;
                                                  });
                                                }
                                              },
                                              child: _value2 == false
                                                  ? Center(
                                                      child: AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            gradient:
                                                                LinearGradient(
                                                              colors:
                                                                  animCont[1]
                                                                      ["color"],
                                                              begin: Alignment
                                                                  .bottomRight,
                                                              end: Alignment
                                                                  .topLeft,
                                                            ),
                                                          ),
                                                          height: 80,
                                                          width: 80,
                                                          child: Center(
                                                            child: Text(
                                                                "Female",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          )),
                                                    )
                                                  : Center(
                                                      child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[5]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Icon(Icons.done),
                                                    )))
                                        ],
                                      ),
                                    ],
                                  )))),
                      Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: AnimatedContainer(
                              curve: Curves.bounceInOut,
                              duration: Duration(milliseconds: 500),
                              height: 150,
                              child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Relation:",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                              onTap: () {
                                                relation = "F";
                                                if (_value6 == false) {
                                                  setState(() {
                                                    _value5 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    _value5 = true;
                                                    _value6 = false;
                                                  });
                                                }
                                              },
                                              child: _value5 == false
                                                  ? AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.bounceInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[1]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Center(
                                                        child: Text(
                                                          "Friend",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ))
                                                  : AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[5]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Icon(Icons.done),
                                                    )),
                                          GestureDetector(
                                              onTap: () {
                                                relation = "N";
                                                if (_value5 == false) {
                                                  setState(() {
                                                    _value6 = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    _value6 = true;
                                                    _value5 = false;
                                                  });
                                                }
                                              },
                                              child: _value6 == false
                                                  ? Center(
                                                      child: AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve:
                                                              Curves.easeInOut,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            gradient:
                                                                LinearGradient(
                                                              colors:
                                                                  animCont[1]
                                                                      ["color"],
                                                              begin: Alignment
                                                                  .bottomRight,
                                                              end: Alignment
                                                                  .topLeft,
                                                            ),
                                                          ),
                                                          height: 80,
                                                          width: 80,
                                                          child: Center(
                                                            child: Text(
                                                                "Neighbour",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          )),
                                                    )
                                                  : Center(
                                                      child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeInOut,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: animCont[5]
                                                              ["color"],
                                                          begin: Alignment
                                                              .bottomRight,
                                                          end:
                                                              Alignment.topLeft,
                                                        ),
                                                      ),
                                                      height: 80,
                                                      width: 80,
                                                      child: Icon(Icons.done),
                                                    )))
                                        ],
                                      ),
                                    ],
                                  )))),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  // border: Border.all(
                                  //     color: Colors.white,
                                  //     style: BorderStyle.solid,
                                  //     width: 0.80),
                                ),
                                child: DropdownButton(
                                  iconDisabledColor: Colors.black,
                                  hint: Text(
                                    getTranslated(context, 'select_state'),
                                    // 'अपना राज्य चुनें',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                  ),
                                  value: selectedState,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedState = newValue;
                                    });
                                  },
                                  items: states.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location,
                                          style:
                                              TextStyle(color: Colors.black)),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: DropdownButton(
                                  hint: Text(
                                      getTranslated(context, 'select_district'),
                                      // 'अपने जिले का चयन करें',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  value: selectedDistrict,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedDistrict = newValue;
                                    });
                                  },
                                  items: dRajasthan.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location,
                                          style:
                                              TextStyle(color: Colors.black)),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          obscureText: false,
                          controller: nameEditor,
                          keyboardType: TextInputType.text,
                          // controller: passEditor,
                          decoration: InputDecoration(
                            labelText: getTranslated(context, 'name'),
                            // "नाम दर्ज करें",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: mobEditor,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          // controller: passEditor,
                          decoration: InputDecoration(
                            labelText: getTranslated(context, 'mob'),
                            //  "मोबाइल नंबर",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: colnyEditor,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          // controller: passEditor,
                          decoration: InputDecoration(
                            labelText: getTranslated(context, 'col'),
                            //  "कालोनी",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          obscureText: false,
                          controller: hnumberEditor,
                          keyboardType: TextInputType.text,
                          // controller: passEditor,
                          decoration: InputDecoration(
                            labelText: getTranslated(context, 'hnumber'),
                            // "घर का नंबर",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                          width: 200,
                          child: RaisedButton(
                            color: Color(0xFF57bbd8),
                            highlightElevation: 10,
                            onPressed: () {
                              var mob = int.parse(mobEditor.text);
                              makePost2(
                                  relation,
                                  nameEditor.text,
                                  colnyEditor.text,
                                  selectedState.toString(),
                                  selectedDistrict.toString(),
                                  hnumberEditor.text,
                                  mob,
                                  gender);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            child: Text(
                              "Submit",
                              // getTranslated(context, 'login'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

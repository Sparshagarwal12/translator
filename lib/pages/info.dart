import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

void makePost2(
    String a, String b, String c, String d, String e, String f, var g,String h) async {
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

  var valu, valu1,valu2;
  bool valu3 = false, valu4 = false,valu5 = false,valu6 = false;
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
         height: MediaQuery.of(context).size.height ,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Image(image: AssetImage('images/flag.gif')),
                      // Text(
                      //   "अपने देश की रक्षा के लिए कृपया हमारा समर्थन करें",
                      //   style: TextStyle(
                      //       fontSize: 30, fontWeight: FontWeight.bold),
                      //   textAlign: TextAlign.center,
                      // ),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(getTranslated(context, 'gender')),
                              Checkbox(
                              value: valu5,
                              onChanged: (bool value) {
                                setState(() {
                                  valu2 = 'male';
                                  valu5 = value;
                                });
                              },
                            ),
                              Text(
                                getTranslated(context, 'male')
                                // "पुरुष"
                                ),
                              Checkbox(
                              value: valu6,
                              onChanged: (bool value) {
                                setState(() {
                                  valu2 = 'female';
                                  valu6 = value;
                                });
                              },
                            ),
                              Text(
                                getTranslated(context, 'female')
                                // "महिला"
                                )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              getTranslated(context, 'relation')
                              // "रिश्ता:"
                              ),
                            Checkbox(
                              value: valu3,
                              onChanged: (bool value) {
                                setState(() {
                                  valu1 = 'N';
                                  valu3 = value;
                                });
                              },
                            ),
                            Text(
                              getTranslated(context, 'neighbor')
                              // "पड़ोसी"
                              ),
                            Checkbox(
                              value: valu4,
                              onChanged: (bool value) {
                                setState(() {
                                  valu1 = 'F';
                                  valu4 = value;
                                });
                              },
                            ),
                            Text(
                              getTranslated(context, 'friend')
                              // "मित्र"
                              )
                          ],
                        ),
                      ),
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
                              borderRadius: new BorderRadius.circular(5.0),
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
                            labelText:getTranslated(context, 'mob'),
                            //  "मोबाइल नंबर",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
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
                            labelText:getTranslated(context, 'col'),
                            //  "कालोनी",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
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
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                              child: RaisedButton(
                            onPressed: () {
                              var mob = int.parse(mobEditor.text);
                              makePost2(
                                  valu1.toString(),
                                  nameEditor.text,
                                  colnyEditor.text,
                                  selectedState.toString(),
                                  selectedDistrict.toString(),
                                  hnumberEditor.text,
                                  mob,
                                  valu2.toString());
                            },
                            //   Fluttertoast.showToast(
                            //       msg: valu2.toString(),
                            //       toastLength: Toast.LENGTH_SHORT);
                            // },
                            child: Text(
                              getTranslated(context, 'submit'),
                              // "Submit"
                              ),
                          )))
                    ],
                  ))
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class BankPost extends StatefulWidget {
  @override
  _BankPost createState() => _BankPost();
}

Future makePost(String a, String b, String c, String d, String e, var f,
    String g, var h) async {
  String url = "http://covid-mitrc.herokuapp.com/apis/bank/create";
  var body = {
    "state": a,
    "district": b,
    "bank": c,
    "branch": d,
    "name": e,
    "aadhar": f,
    "withdrawl": g,
    "distance": h
  };
  Response r = await post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: json.encode(body),
  );
  print(r.body);
}

TextEditingController name = new TextEditingController();
TextEditingController district = new TextEditingController();
TextEditingController state = new TextEditingController();
TextEditingController bank = new TextEditingController();
TextEditingController branch = new TextEditingController();
TextEditingController withdraw = new TextEditingController();
TextEditingController distance = new TextEditingController();
TextEditingController aadhar = new TextEditingController();
// TextEditingController name = new TextEditingController();

class _BankPost extends State<BankPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("India's Fight Against Corona")),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFFbdc3c7),
              Color(0xFF2c3e50),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Image(image: AssetImage('images/bank.png')),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "User Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: district,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "District Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: state,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "State Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: bank,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Bank Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: branch,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Branch Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: aadhar,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Aadhar Number",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: withdraw,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "WithDrwal",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: false,
                        controller: distance,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Distance",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        width: 200,
                        child: RaisedButton(
                          color: Color(0xFF57bbd8),
                          highlightElevation: 10,
                          onPressed: () {
                            var adh = int.parse(aadhar.text);
                              // var latu = double.parse(lat.toString());
                            makePost(
                                state.text,
                                district.text,
                                bank.text,
                                branch.text,
                                name.text,
                                adh,
                                withdraw.text,
                                distance.text);
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
                ),
              ],
            )));
  }
}

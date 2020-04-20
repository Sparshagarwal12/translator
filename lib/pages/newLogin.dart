import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_localization_master/pages/userrequire.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

List<String> users = ["Hospital", "Citizen"];
String selectedUser;
TextEditingController adhharEditor = new TextEditingController();
TextEditingController passEditor = new TextEditingController();

bool _check = false, _check2 = false, _check3 = false;

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 20),
            Center(
                child: Text("Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.blue))),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      if (_check2 == false && _check3 == false) {
                        setState(() {
                          _check = true;
                        });
                      } else if (_check2 == true || _check3 == true) {
                        setState(() {
                          _check = true;
                          _check2 = false;
                          _check3 = false;
                        });
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            height: 120,
                            width: 120,
                            child: _check == false
                                ? Card(
                                    elevation: 10,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/citizenlogo.png')))
                                : Card(
                                    color: Colors.blue,
                                    elevation: 10,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/citizenlogo.png')))))),
                GestureDetector(
                    onTap: () {
                      if (_check == false && _check3 == false) {
                        setState(() {
                          _check2 = true;
                        });
                      } else if (_check == true || _check3 == true) {
                        setState(() {
                          _check2 = true;
                          _check = false;
                          _check3 = false;
                        });
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            height: 120,
                            width: 120,
                            child: _check2 == false
                                ? Card(
                                    elevation: 10,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/farmerlogo.png')))
                                : Card(
                                    color: Colors.blue,
                                    elevation: 10,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/farmerlogo.png')))))),
              ],
            ),
            GestureDetector(
                onTap: () {
                  if (_check == false && _check2 == false) {
                    setState(() {
                      _check3 = true;
                    });
                  } else if (_check2 == true || _check == true) {
                    setState(() {
                      _check3 = true;
                      _check2 = false;
                      _check = false;
                    });
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(bottom:10),
                    child: Container(
                        height: 120,
                        width: 120,
                        child: _check3 == false
                            ? Card(
                                elevation: 10,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/frontlinelogo.png')))
                            : Card(
                                color: Colors.blue,
                                elevation: 10,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/frontlinelogo.png')))))),
            _check == false && _check2 == false
                ? Center(
                    child: Text(
                    "Please Select Catagory",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))
                : Center(
                    child: _check == true
                        ? Text(
                            "You Selected Citizen Catagory",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "You Selected Farmer Catagory",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
            SizedBox(height: 50),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                    controller: adhharEditor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.format_list_numbered),
                      labelText: "Enter Your Phone Number",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                    ))),
            SizedBox(height: 30),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                    obscureText: true,
                    controller: passEditor,
                    decoration: InputDecoration(
                      labelText: "Enter Your Password",
                      prefixIcon: Icon(Icons.lock),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                    ))),
            SizedBox(height: 40),
            Container(
              width: 200,
              child: RaisedButton(
                color: Color(0xFF57bbd8),
                highlightElevation: 10,
                onPressed: () {
                  if (passEditor.text != "" && adhharEditor.text != "") {
                    login();
                  } else {
                    return showDialog(
                        context: (context),
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Failed",
                              // getTranslated(
                              //     context, 'failed'),
                            ),
                            content: Text("One or More fields are empty"
                                // getTranslated(
                                //     context, 'one_or_more'),
                                ),
                            actions: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.done),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          );
                        });
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                child: Text(
                  "Login",
                  // getTranslated(context, 'login'),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No Account?\t",
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text("SignUp", style: TextStyle(color: Colors.blue)))
              ],
            )
          ],
        ),
      ],
    )));
  }

  Future<dynamic> login() async {
    print(adhharEditor.text);
    print(passEditor.text);
    String url = "https://covid-mitrc.herokuapp.com/accounts/login";
    var req = {"username": adhharEditor.text, "password": passEditor.text};
    Response response = await post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(req),
    );
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      if (res['aadhar'] != null || res['aadhar'] != "") {
        prefs.setString('aadhar', res['aadhar']);
        prefs.setBool('declared', true);
        prefs.setInt('id', res['id']);
        print(
            'User -> Aadhar : ${prefs.getString("aadhar")}, ID : ${prefs.getInt("id")}');
        Fluttertoast.showToast(msg: "Login Succeed!");
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => userReq()), (_) => false);
      }
    } else {
      Fluttertoast.showToast(msg: res['error']);
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/pages/coronaMonitor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> users = ["Hospital", "Citizen"];
  String selectedUser;
  TextEditingController adhharEditor = new TextEditingController();
  TextEditingController passEditor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "Login",
          getTranslated(context, 'login'),
        ),
        backgroundColor: Color(0xFF426bd7),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/fightindia.jpg")),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF3180e4),
                            Color(0xFF564dc2),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  color: Colors.white,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                //alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 150),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          //padding: EdgeInsets.only(bottom: 100),
                          width: 300,
                          height: 300,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 10.0,
                            color: Colors.white,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 10.0, right: 10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        // "LOGIN",
                                        getTranslated(context, 'login'),
                                        style: TextStyle(fontSize: 17.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          // "Adhaar",
                                          getTranslated(context, 'adhaar'),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0),
                                        )),
                                    TextFormField(
                                      obscureText: false,
                                      controller: adhharEditor,
                                      keyboardType:TextInputType.number,
                                      decoration: InputDecoration(
                                        //hintText: "E-Mail",
                                        //prefixIcon: Icon(Icons.alternate_email),
                                        //border: InputBorder.none,
                                        fillColor: Colors.red,
                                      ),
                                      //onSaved: (value) => ,
                                    ),
                                    // SizedBox(
                                    //     height: 0.8,
                                    //     child: Container(
                                    //       height: 0.8,
                                    //       width: 235.0,
                                    //       color: Colors.black26,
                                    //     )),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          // "Password"
                                          getTranslated(context, 'password'),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0),
                                        )),
                                    TextField(
                                      obscureText: true,
                                      controller: passEditor,
                                      decoration: InputDecoration(
                                          // labelText: "Password",
                                          // prefixIcon: Icon(Icons.lock_outline),
                                          //  border: InputBorder.none
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    DropdownButton(
                                      hint: Text('Select User type',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      value: selectedUser,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedUser = newValue;
                                        });
                                      },
                                      items: users.map((location) {
                                        return DropdownMenuItem(
                                          child: new Text(location,
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 270),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF426bd7),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 10.0)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (passEditor.text != "" &&
                                        adhharEditor.text != "") {
                                      login();
                                    } else {
                                      return showDialog(
                                          context: (context),
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                // "Failed",
                                                getTranslated(
                                                    context, 'failed'),
                                              ),
                                              content: Text(
                                                // "One or More fields are empty"
                                                getTranslated(
                                                    context, 'one_or_more'),
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
                                  child: Text(
                                    // "Login"
                                    getTranslated(context, 'login'),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CoronaMonitor()),
            (_) => false);
      }
    } else {
      Fluttertoast.showToast(msg: res['error']);
    }
  }
}
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

bool v1 = false, v2 = false, v3 = false;

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                  child: Text("Register Page",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        if (v2 == false && v3 == false) {
                          setState(() {
                            v1 = true;
                          });
                        } else if (v2 == true || v3 == true) {
                          setState(() {
                            v2 = false;
                            v3 = false;
                            v1 = true;
                          });
                        }
                      },
                      child: Container(
                          height: 150,
                          width: 150,
                          child: v1 == true
                              ? Card(
                                  color: Colors.blue,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/farmerlogo.png')),
                                )
                              : Card(
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/farmerlogo.png')),
                                ))),
                  GestureDetector(
                      onTap: () {
                        if (v1 == false && v3 == false) {
                          setState(() {
                            v2 = true;
                          });
                        } else if (v1 == true || v3 == true) {
                          setState(() {
                            v1 = false;
                            v3 = false;
                            v2 = true;
                          });
                        }
                      },
                      child: Container(
                          height: 150,
                          width: 150,
                          child: v2 == true
                              ? Card(
                                  color: Colors.blue,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/frontlinelogo.png')),
                                )
                              : Card(
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/frontlinelogo.png')),
                                ))),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    if (v2 == false && v1 == false) {
                      setState(() {
                        v3 = true;
                      });
                    } else if (v2 == true || v1 == true) {
                      setState(() {
                        v2 = false;
                        v1 = false;
                        v3 = true;
                      });
                    }
                  },
                  child: Container(
                      height: 150,
                      width: 150,
                      child: v3 == true
                          ? Card(
                              color: Colors.blue,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/citizenlogo.png')),
                            )
                          : Card(
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/citizenlogo.png')),
                            ))),
              SizedBox(height: 30),
               v2 == true
                  ? Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        // controller: ,
                        decoration: InputDecoration(
                            labelText: "Enter the Key for Login as Volunteer",
                            border: OutlineInputBorder(
                              borderSide: new BorderSide(),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ))
                  : SizedBox(
                      height: 0.0,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    // controller: ,
                    decoration: InputDecoration(
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    // controller: ,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  width: 200,
                  child: RaisedButton(
                    color: Color(0xFF57bbd8),
                    highlightElevation: 10,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      "Register",
                      // getTranslated(context, 'login'),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already Registered?\t"),
                  GestureDetector(
                      onTap: () {},
                      child:
                          Text("Login", style: TextStyle(color: Colors.blue)))
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}

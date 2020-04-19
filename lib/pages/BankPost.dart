import 'package:flutter/material.dart';

class BankPost extends StatefulWidget {
  @override
  _BankPost createState() => _BankPost();
}

TextEditingController name = new TextEditingController();
TextEditingController district = new TextEditingController();
TextEditingController state = new TextEditingController();
TextEditingController bank = new TextEditingController();
TextEditingController branch = new TextEditingController();
TextEditingController mobile = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController postal = new TextEditingController();
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
                          hintText: "Operator Name",
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
                        controller: postal,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Phone Number",
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
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Email Id:",
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
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFc2c6c8),
                          hintText: "Postal Code",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}

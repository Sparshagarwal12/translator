import 'package:flutter_localization_master/pages/coronaMonitor.dart';
import 'package:flutter_localization_master/pages/homePage.dart';

import 'DeclarationForm.dart';
import 'MyHomePage.dart';
import 'grid.dart';
import 'LanguagePage.dart';
import 'slefDeclaration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

Future<SharedPreferences> getPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    getPrefs().then((value) {
      SharedPreferences prefs = value;
      if (prefs.getString('aadhar') != null) {
        if (prefs.getBool('declared') == false ||
            prefs.getBool('declared') == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SelectMembers()),
              (_) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>CoronaMonitor()),
              (_) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (_) => false);
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 10.0,
          ),
        ),
      ),
    );
  }
}
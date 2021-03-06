import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/BankPost.dart';
import 'package:flutter_localization_master/pages/LoginPage.dart';
import 'package:flutter_localization_master/pages/LanguagePage.dart';
import 'package:flutter_localization_master/pages/PatientReport.dart';
import 'package:flutter_localization_master/pages/developerPage.dart';
import 'package:flutter_localization_master/pages/info.dart';
import 'package:flutter_localization_master/pages/newLogin.dart';
import 'package:flutter_localization_master/pages/newRegister.dart';
import 'package:flutter_localization_master/pages/splashPage.dart';
import 'package:flutter_localization_master/pages/userrequire.dart';
// import 'package:flutter_localization_master/pages/settings_page.dart';
import 'package:flutter_localization_master/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => BankPost());
      // case loginRoute:
      //   return MaterialPageRoute(builder: (_) => LoginPage());
      // default:
      //   return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
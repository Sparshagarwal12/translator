import 'package:flutter/material.dart';
import 'package:flutter_localization_master/pages/precaution.dart';
import 'package:flutter_localization_master/pages/youtube.dart';
import 'adviceinner.dart';
import 'audiodata.dart';
import 'awareness.dart';
import 'externaltest.dart';
import 'faqPage.dart';
import 'googlemaps.dart';
import 'helpLine.dart';
import 'hospitalinner.dart';
import 'info.dart';
import 'ministry.dart';
import 'othersource.dart';
import 'testinggrid.dart';
import 'userrequire.dart';

class hospitalgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: hospitalinner());
  }
}

class videogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Vid());
  }
}

class faqgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FAQPage());
  }
}

class precautiongrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Precaution());
  }
}

class awaregrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Awareness());
  }
}

class advicegrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AdviceInner());
  }
}

class helpgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HelpLine());
  }
}

class labgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: testinggrid1());
  }
}

class blackgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MapPage());
  }
}

class ministrygrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Ministry());
  }
}

class audiogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: audiodata());
  }
}

class usergrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: userReq());
  }
}

class infogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Info());
  }
}

class exterTestgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ExternalTest());
  }
}

class outgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OtherSource());
  }
}

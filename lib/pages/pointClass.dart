import 'package:flutter/material.dart';
import 'adviceinner.dart';
import 'audiodata.dart';
import 'awareness.dart';
import 'deathgrid.dart';
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
import 'videoPage.dart';


class secondgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: deathgrid());
  }
}

class hospitalgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: hospitalinner());
  }
}

class videogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: VideoPage());
  }
}

class faqgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: FAQPage());
  }
}

class precautiongrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: deathgrid());
  }
}

class awaregrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: Awareness());
  }
}

class advicegrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: AdviceInner());
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
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: testinggrid1());
  }
}

class blackgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: MapPage());
  }
}

class ministrygrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: Ministry());
  }
}

class audiogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: audiodata());
  }
}

class usergrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: userReq());
  }
}

class infogrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: Info());
  }
}

class exterTestgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body: ExternalTest());
  }
}

class outgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("कोरोना के खिलाफ भारत की लड़ाई"),
        ),
        body:OtherSource());
  }
}
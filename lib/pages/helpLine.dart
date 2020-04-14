import 'searchPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLine extends StatefulWidget {
  @override
  _HelpLineState createState() => _HelpLineState();
}

Future<List<dynamic>> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/accounts/helpline";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

List<Color> color1 = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];
List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];

Route createRoute(Widget name) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutQuad;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

double width;
double height;
List<String> states = [];
List<int> centres = [];
String searchQuery;
TextEditingController queryEditor = new TextEditingController();

class _HelpLineState extends State<HelpLine> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // GestureDetector(child: IconButton(

        //   icon:Icon('Icons.arrow_back'),
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },))

        leading: Image(image: AssetImage('images/Corona.png')),
        title: Center(
          child: Text(
            "हेल्पलाइन नंबर",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 20.0,
                      //context: context,
                      title: Text("डेटा दर्ज करें"),
                      content: TextField(onSubmitted: (value) {
                        if (states.contains(value)) {
                          searchQuery = value.toUpperCase();
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        } else {
                          Navigator.pop(context);
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("गलत सवाल किया"),
                                  content: Text("कृपया कीवर्ड जांचें"),
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
                      }),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.done),
                            onPressed: () {
                              Navigator.pop(context);
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("गलत सवाल किया"),
                                      content: Text("कृपया कीवर्ड जांचें"),
                                      actions: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.done),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  });
                            })
                      ],
                    );
                  },
                );
              })
        ],
        elevation: 0.0,
        backgroundColor: Color(0xFFFF9933),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: FutureBuilder(
            future: getUri(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List content = snapshot.data;
                for (int i = 0; i < content.length; i++) {
                  if (!states.contains(content[i]["state"])) {
                    states.add(content[i]["state"]);
                  }
                }
                states.sort((a, b) => a.toString().compareTo(b.toString()));
                return ListView.builder(
                  itemCount: states.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          helpLineDetails(states[index])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: index % 2 == 0 ? color1 : color2,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 15.0,
                                      offset: Offset.fromDirection(1.0, 10.0))
                                ],
                              ),
                              margin: EdgeInsets.all(10.0),
                              width: 300,
                              height: 100,
                              child: Center(
                                  child: Text(
                                states[index],
                                style: TextStyle(fontSize: 20.0),
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: SpinKitChasingDots(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              }
            }),
      ),
    );
  }
}

Widget helpLineDetails(String state) {
  return Scaffold(
    appBar: AppBar(
      leading: Image.asset('images/Corona.png'),
      backgroundColor: Color(0xFFFF9933),
      title: Center(
        child: Text(
          state,
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      elevation: 0.0,
      automaticallyImplyLeading: false,
    ),
    body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF9933),
            Color(0xFFFFFFFF),
            Color(0xFF138808),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: FutureBuilder(
          future: getUri(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List content = snapshot.data;
              return ListView.builder(
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  if (content[index]["state"] == state) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                            child: Column(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0 ? color1 : color2,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 15.0,
                                        offset: Offset.fromDirection(1.0, 10.0))
                                  ],
                                ),
                                margin: EdgeInsets.all(10.0),
                                // width: 300,
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.call),
                                            onPressed: () => launch("tel://" +
                                                content[index]["contact1"]
                                                    .toString())),
                                        Text(
                                          "Phone: " +
                                              content[index]["contact1"]
                                                  .toString(),
                                          style: TextStyle(fontSize: 25.0),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0 ? color1 : color2,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 15.0,
                                        offset: Offset.fromDirection(1.0, 10.0))
                                  ],
                                ),
                                margin: EdgeInsets.all(10.0),
                                // width: 300,
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.call),
                                            onPressed: () => launch("tel://" +
                                                content[index]["contact2"]
                                                    .toString())),
                                        Text(
                                          "Phone: " +
                                              content[index]["contact2"]
                                                  .toString(),
                                          style: TextStyle(fontSize: 25.0),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0 ? color1 : color2,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 15.0,
                                        offset: Offset.fromDirection(1.0, 10.0))
                                  ],
                                ),
                                margin: EdgeInsets.all(10.0),
                                // width: 300,
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.call),
                                            onPressed: () => launch("tel://" +
                                                content[index]["contact3"]
                                                    .toString())),
                                        Text(
                                          "Phone: " +
                                              content[index]["contact3"]
                                                  .toString(),
                                          style: TextStyle(fontSize: 25.0),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0 ? color1 : color2,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 15.0,
                                        offset: Offset.fromDirection(1.0, 10.0))
                                  ],
                                ),
                                margin: EdgeInsets.all(10.0),
                                // width: 300,
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.call),
                                            onPressed: () => launch("tel://" +
                                                content[index]["contact4"]
                                                    .toString())),
                                        Text(
                                          "Phone: " +
                                              content[index]["contact4"]
                                                  .toString(),
                                          style: TextStyle(fontSize: 25.0),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: index % 2 == 0 ? color1 : color2,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 15.0,
                                        offset: Offset.fromDirection(1.0, 10.0))
                                  ],
                                ),
                                margin: EdgeInsets.all(10.0),
                                // width: 300,
                                height: 130,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.mail),
                                            onPressed: () {}),
                                        Text(
                                          "Email: " + content[index]["email"],
                                          style: TextStyle(fontSize: 25.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                          ],
                        )),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return Center(
                  child: SpinKitChasingDots(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
            }
          },
        )),
  );
}

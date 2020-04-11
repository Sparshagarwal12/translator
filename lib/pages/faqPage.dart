import 'registerVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globalVar.dart' as global;
import 'translateAPI.dart' as translate;

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

List<Color> color1 = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];
List<Color> color2 = [
  Color(0xFF8E2DE2),
  Color(0xFF4A00E0),
];
List<String> que = [];
List<String> ans = [];

class _FAQPageState extends State<FAQPage> {
  String text = "Loading...";
  void translate(String q, String a) async {
    String question = q;
    String answer = a;
    String qurl =
        "https://translation.googleapis.com/language/translate/v2?target=hi&key=AIzaSyAu7bUrwnWzbfN2lK-zGxdf-KHbzvm-PNA&q=$question";
    http.Response qresponse = await http.post(qurl);
    Map qcontent = json.decode(qresponse.body);
    String aurl =
        "https://translation.googleapis.com/language/translate/v2?target=hi&key=AIzaSyAu7bUrwnWzbfN2lK-zGxdf-KHbzvm-PNA&q=$answer";
    http.Response aresponse = await http.post(aurl);
    Map acontent = json.decode(aresponse.body);
    // if (!data.contains(content["data"]["translations"][0]["translatedText"])) {
    if (!que.contains(qcontent["data"]["translations"][0]["translatedText"]) &&
        qcontent["data"] != null) {
      que.add(qcontent["data"]["translations"][0]["translatedText"]);
    }
    if (!ans.contains(acontent["data"]["translations"][0]["translatedText"]) &&
        acontent["data"] != null) {
      ans.add(acontent["data"]["translations"][0]["translatedText"]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ PAGE",
          style: TextStyle(fontSize: 30.0, color: Colors.black),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: global.getUri(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List content = snapshot.data;
              return ListView.builder(
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  translate(content[index]["que"], content[index]["ans"]);
                  if (que.length > index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 700),
                      child: SlideAnimation(
                        horizontalOffset: 70.0,
                        verticalOffset: 70.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  (index + 1).toString() +
                                      ". " +
                                      (que[index] == null
                                          ? "Loading..."
                                          : que[index]),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    ans[index] == null
                                        ? "Loading...."
                                        : ans[index],
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 0.0,
                    );
                  }
                },
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
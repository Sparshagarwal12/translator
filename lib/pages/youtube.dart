import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Vid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Future<List<dynamic>> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/accounts/video";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";
// https://www.youtube.com/watch?v=gpVruTsSAlk
  YoutubePlayerController _controller;

  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // _controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(videoURL));
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Player"),
      ),
      body: Container(
          child: FutureBuilder(
              future: getUri(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List content = snapshot.data;
                  return ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: YoutubePlayer(
                          controller: _controller = YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  content[index]["link"].toString())),
                          showVideoProgressIndicator: true,
                        ));
                      });
                }
              })),
    );
  }
}

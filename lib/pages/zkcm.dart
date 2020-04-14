import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() => _LocalAudio();
}

List<Color> color2 = [
  Color(0xFFff9966),
  Color(0xFFff5e62),
];

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            audioCache.play('अमिताभ-बच्चन-का-संदेश.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: color2,
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
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "अमिताभ-बच्चन-का-संदेश.mp3",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3');
            // audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: color2,
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
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "क्या करें   पीएम मोदी जी द्वारा.mp3",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            audioCache.play('सामान्य-जागरूकता-ऑडियो-हिंदी.mp3');
            // audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: color2,
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
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "सामान्य-जागरूकता-ऑडियो-हिंदी.mp3",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            audioCache.play('क्या-करें अमिताभ-बच्चन-जी-द्वारा.mp3');
            // audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: color2,
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
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "क्या-करें अमिताभ-बच्चन-जी-द्वारा.mp3",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            audioCache.play('पीएम-मोदी-जी-का-संदेश.mp3');
            // audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: color2,
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
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "पीएम-मोदी-जी-का-संदेश.mp3",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 150,
        height: 45,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(txt),
            color: Colors.pink[900],
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }
// List<String> aud = ['',

// '
// '
// 'सामान्य जागरूकता ऑडियो अंग्रेजी.mp3',

// ];
  // Widget slider() {
  //   return Slider(
  //       activeColor: Colors.black,
  //       inactiveColor: Colors.pink,
  //       value: _position.inSeconds.toDouble(),
  //       min: 0.0,
  //       max: _duration.inSeconds.toDouble(),
  //       onChanged: (double value) {
  //         setState(() {
  //           seekToSecond(value.toInt());
  //           value = value;
  //         });
  //       });
  // }

  Widget LocalAudio() {
    return _tab([
      // _btn('Play', () => audioCache.play('क्या करें   पीएम मोदी जी द्वारा.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop()),
      // slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.teal,
          title: Center(child: Text('LOCAL AUDIO')),
        ),
        body: TabBarView(
          children: [LocalAudio()],
        ),
      ),
    );
  }
}

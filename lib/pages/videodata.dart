import 'package:flutter/material.dart';

class video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "कोविड-19",
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFFFF9933),
                Color(0xFFFFFFFF),
                Color(0xFF138808),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Stack(
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text("कोविड-19 से संबंधित वीडियो",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: getListView(),
                  )
                ],
              ))),
    );
  }
}

List<String> getListElements() {
  var items = List<String>.generate(
      1000, (counter) => "https://www.youtube.com/watch?v=9JYJGO6Pcc4$counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
          color: Color(0xFFecf0f1),
          elevation: 10.0,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text(listItems[index]),
                onTap: () {
                  print('${listItems[index]} was tapped');
                },
              )
            ],
          ),
        ));
  });

  return listView;
}

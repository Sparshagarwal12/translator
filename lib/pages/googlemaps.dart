import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

Future<List<dynamic>> getUri() async {
  String url = "https://covid-mitrc.herokuapp.com/apis/govt";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

GoogleMapController mapController;
List content;
int length = 1;

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      markers.clear();
      for (int i = 0; i < 29; i++) {
        final marker = Marker(
          onTap: () {
            return showDialog(
                context: (context),
                builder: (context) {
                  return AlertDialog(
                    title: Text(content[i]["state"]),
                    content: Text("Total Cases: " +
                        content[i]["cases"].toString() +
                        "\nTotal deaths: " +
                        content[i]["death"].toString() +
                        "\nTotal Cured: " +
                        content[i]["cured"].toString()),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  );
                });
          },
          markerId: MarkerId(content[i]["id"].toString()),
          position: LatLng(double.parse(content[i]["latitude"]),
              double.parse(content[i]["longitude"])),
          infoWindow: InfoWindow(),
        );
        markers[content[i]["state"]] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Google Map",
            style: TextStyle(color: Colors.black),
          )),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: getUri(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              content = snapshot.data;
              if (true) {
                return GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: LatLng(20.5937, 78.9629)),
                  onMapCreated: _onMapCreated,
                  markers: markers.values.toSet(),
                  // markers: ,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                ),
              );
            }
          },
        ));
  }
}
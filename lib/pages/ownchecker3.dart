import 'package:flutter_localization_master/localization/language_constants.dart';
import 'lastchecker.dart';
import 'package:flutter/material.dart';
import 'wardn.dart';

class ownchecker3 extends StatefulWidget {
  @override
  _ownchecker3 createState() => _ownchecker3();
}

class _ownchecker3 extends State<ownchecker3> {
  int _radioValue, _radioValue2;

  void _handleRadio(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _handleRadio2(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  List<String> users = ["Hospital", "Citizen"];
  String text;

  bool val0 = false,
      val1 = false,
      val2 = false,
      val3 = false,
      val4 = false,
      val5 = false,
      val6 = false,
      val7 = false,
      val8 = false,
      val9 = false,
      val10 = false,
      val11 = false,
      val12 = false,
      val13 = false,
      val14 = false,
      val15 = false,
      val16 = false;
  String selectedUser;
  TextEditingController emailEditor = new TextEditingController();
  TextEditingController passEditor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF3180e4),
                    Color(0xFF564dc2),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  color: Colors.white,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                     SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Image(image: AssetImage('images/forindia.gif')),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11,
                    ),
                    Center(
                      child: Container(
                        //padding: EdgeInsets.only(bottom: 100),
                        width: 300,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 10.0,
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 15.0, left: 10.0, right: 10.0),
                            child: ListView(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    getTranslated(context, 'own_ques3'),
                                    // "क्या आपके पास निम्न जीवन-धमकी के कोई लक्षण हैं?",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val0,
                                            onChanged: (bool value0) {
                                              setState(() {
                                                val0 = value0;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp1'),
                                          // "सांस लेने में कठिनाई"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val1,
                                            onChanged: (bool value1) {
                                              setState(() {
                                                val1 = value1;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp2')
                                          // "बुखार"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val2,
                                            onChanged: (bool value2) {
                                              setState(() {
                                                val2 = value2;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp3'),
                                          // "सूखी खाँसी"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val3,
                                            onChanged: (bool value3) {
                                              setState(() {
                                                val3 = value3;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp4')
                                          // "दर्द"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val4,
                                            onChanged: (bool value4) {
                                              setState(() {
                                                val4 = value4;
                                              });
                                            }),
                                        Text(
                                          // getTranslated(context, 'symp5')
                                          "नाक बहना"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val5,
                                            onChanged: (bool value5) {
                                              setState(() {
                                                val5 = value5;
                                              });
                                            }),
                                        Text(
                                          // getTranslated(context, 'symp6')
                                          "गले में खराश"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val6,
                                            onChanged: (bool value6) {
                                              setState(() {
                                                val6 = value6;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp7')
                                          // "सरदर्द"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val7,
                                            onChanged: (bool value7) {
                                              setState(() {
                                                val7 = value7;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp8')
                                          // "दस्त"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val8,
                                            onChanged: (bool value8) {
                                              setState(() {
                                                val8 = value8;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp9')
                                          // "नीले रंग का होंठ या चेहरा"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val9,
                                            onChanged: (bool value9) {
                                              setState(() {
                                                val9 = value9;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp10')
                                            // "छाती में गंभीर और लगातार दर्द या दबाव"
                                            )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val10,
                                            onChanged: (bool value10) {
                                              setState(() {
                                                val10 = value10;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp11')
                                          // "लगातार चक्कर आना "
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val11,
                                            onChanged: (bool value11) {
                                              setState(() {
                                                val11 = value11;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp12')
                                          // "उलझा हुआ अभिनय"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val12,
                                            onChanged: (bool value12) {
                                              setState(() {
                                                val12 = value12;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp13')
                                          // "अचेतन या बहुत मुश्किल से जागना"
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val13,
                                            onChanged: (bool value13) {
                                              setState(() {
                                                val13 = value13;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp14')
                                          // "बोलने पर शब्दों का खराब उच्चारण"
                                          ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val14,
                                            onChanged: (bool value14) {
                                              setState(() {
                                                val14 = value14;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp15')
                                            // "पिछले 14 दिनों में विदेश यात्रा की"
                                            )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val15,
                                            onChanged: (bool value15) {
                                              setState(() {
                                                val15 = value15;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp16')
                                            // "पिछले 2-14 दिनों में ये लक्षण पाए गए"
                                            ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                            value: val16,
                                            onChanged: (bool value16) {
                                              setState(() {
                                                val16 = value16;
                                              });
                                            }),
                                        Text(
                                          getTranslated(context, 'symp17')
                                          // "क्या आप कोरोना वायरस फैल रहा है"
                                          )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF426bd7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26, blurRadius: 10.0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (val0 == true &&
                                    val1 == true &&
                                    val2 == true &&
                                    val3 == true &&
                                    val14 == true &&
                                    val15 == true &&
                                    val16 == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              selfmajorchecker()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => warn()));
                                }
                              },
                              child: Text(
                                getTranslated(context, 'next'),
                                // "Next  >>>",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class selfmajorchecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("कोरोना के खिलाफ भारत की लड़ाई")),
        body: majorchecker());
  }
}

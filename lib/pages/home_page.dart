import 'package:flutter/material.dart';
import 'package:flutter_localization_master/classes/language.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/main.dart';
import 'package:flutter_localization_master/pages/splashPage.dart';
// import 'package:flutter_localization_master/router/route_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Translation"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Language>(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[Text(e.name)],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        body: MaterialButton(
          onPressed: () {
            // To close the Drawer
            Navigator.pop(context);
            // Navigating to About Page
            Navigator.pushNamed(context, 'splash');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SplashPage()),
            // );
          },
          height: 50,
          shape: StadiumBorder(),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }
}

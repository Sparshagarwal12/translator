import 'package:flutter/material.dart';
import 'package:flutter_localization_master/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String BENGALI = 'bn';
const String KANNADA = 'kn';
const String MALYALAM = 'ml';
const String MARATHI = 'mr';
const String HINDI = 'hi';
const String URDU = 'ur';
const String TAMIL = 'ta';
const String TELAGU = 'te';
const String PUNJABI = 'pa';
const String GUJARATI = 'gu';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  // print(_prefs.getString('LANGUAGE_CODE'));
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case BENGALI:
      return Locale(BENGALI, "IN");
    case KANNADA:
      return Locale(KANNADA, "IN");
    case HINDI:
      return Locale(HINDI, "IN");
      case MALYALAM:
      return Locale(MALYALAM, 'IN');
    case MARATHI:
      return Locale(MARATHI, "IN");
    case GUJARATI:
      return Locale(GUJARATI, "IN");
    case URDU:
      return Locale(URDU, "IN");
      case ENGLISH:
      return Locale(ENGLISH, 'IN');
    case PUNJABI:
      return Locale(PUNJABI, "IN");
    case TELAGU:
      return Locale(TELAGU, "IN");
    case TAMIL:
      return Locale(TAMIL, "IN");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}

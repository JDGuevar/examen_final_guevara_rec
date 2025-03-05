import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nombre = "";
  static String _password = "";
  static bool _rememberMe = false;
  

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String nombre){
    _nombre = nombre;
    _prefs.setString('nombre', nombre);
  }

  static String get password {
    return _prefs.getString('password') ?? _password;
  }

  static set password(String password){
    _password = password;
    _prefs.setString('password', password);
  }
  // Recuérdame 
  static bool get rememberMe => _prefs.getBool('rememberMe') ?? _rememberMe;
  static set rememberMe(bool value) {
    _rememberMe = value;
    _prefs.setBool('rememberMe', value);
  }

}
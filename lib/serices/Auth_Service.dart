import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth_Service {

  static late final SharedPreferences prefs;

  static init()
  async{
    prefs = await SharedPreferences.getInstance();
  }


  Future<void> loginUser(String username) async {
    // get shared pref current instance
    log("I am in auth_loginuser ${username}");
    try
    {
      // SharedPreferences sharedPref = await _prefs;
      prefs.setString('username', username);
    }
    catch(e){
      print("Exception in Auth ${e.toString()}");
    }
  }

  void logoutUser(){
    // SharedPreferences sharedPrefs = await _prefs;
    prefs.clear();
  }

  String? getUser()  {
    // SharedPreferences sharedPrefs = await _prefs;
    String? userName = prefs.getString('username');

    return userName;
  }
}

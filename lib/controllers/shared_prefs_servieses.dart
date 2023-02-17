import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServieces {
  bool? result;

  //==================grtting Tocken-------------------->
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('user_details');
    final map = jsonDecode(data!) as Map<String, dynamic>;

    return map['jwtToken'];
  }

//------------------store user details----------------------->
  Future<void> storeUserDetails(Map<String, dynamic> userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    prefs.setString('user_details', json.encode(userDetails));
  }

//-------------------removr user---------------------->
  Future<void> removeUser(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    prefs.remove(
      'user_details',
    );
    prefs.remove("email");
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    ));
  }

// ----------------sstoring email from login and signup page--------------------->
  static Future emailsever(String email) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('email', email);
    log(email);
  }

  //---------------------geting email of use--------------------->
  static getimail() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('email');

    return data!;
  }
}

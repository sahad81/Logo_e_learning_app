import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class  UserServieces{
  bool? result;
 static Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getString('user_details');
  final map = jsonDecode(data!) as Map<String, dynamic>;
  
  return map['jwtToken'];
}
  
    Future<void> storeUserDetails(Map<String, dynamic> userDetails) async {
      
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('isLoggedIn', true);
     
    prefs.setString('user_details', json.encode(userDetails));
    log(userDetails["jwtToken"].toString());
  }
   Future<void> removeUser(context) async {
      
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('isLoggedIn', false);
     
    prefs.remove('user_details',);
 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>SplashScreen(),));
  }

}
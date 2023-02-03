import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class  UserServieces{
  bool? result;
Future <String> getUserDetails() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
     
    Map <String,String> userDetails = prefs.getString('user_details').toS
    String? h=userDetails["ff"];
      String tock= json.decode(userDetails!); 
        log(tock.toString());
    return tock;
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
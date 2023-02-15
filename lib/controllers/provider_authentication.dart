// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:logo_e_learning/servies/login_servieces.dart';
import 'package:logo_e_learning/view/mainpage/screen_main_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

import '../view/Authentication/login_page.dart';

class Authentication extends ChangeNotifier {
  bool passwordishiden = true;
  bool passwordishideniSignup = true;
  bool email_is_valid = true;
  String? email;
  Map<String, dynamic>? _userDetails;

  Map<String, dynamic> get userDetails {
    return _userDetails!;
  }

  TextEditingController email_controler = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  //-------------userlogin-------------------->
  Future loginpostfunction(
    context,
  ) async {
    await LoginServices().loginpostfunction(
        email_controler.text, password_controller.text, context);

    email_controler.clear();
    password_controller.clear();
  }

//---- passwords show and hide---------------->
  togglepasswordviewlogin() {
    passwordishiden = !passwordishiden;
    notifyListeners();
  }

  togglepasswordviewsignUp() {
    passwordishideniSignup = !passwordishideniSignup;
    notifyListeners();
  }

//--------------email checking---------------->
  void ismailisValid(value) {
    email_is_valid = isEmail(value);
    notifyListeners();
  }

//------------checking user or not------------>
  getdata(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? _b = prefs.getBool("isLoggedIn");

    if (_b == true) {
      getimail();
      log("uers");
      Future.delayed(const Duration(seconds: 2)).whenComplete(
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return Screenmainpage();
          }),
        ),
      );
    } else {
      log("not a user");
      Future.delayed(const Duration(seconds: 2)).whenComplete(
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return LoginPage();
          }),
        ),
      );
    }
  }

  getimail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
  }
}

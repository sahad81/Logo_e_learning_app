// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:logo_e_learning/servies/signup_servieces.dart';
import 'package:logo_e_learning/view/Authentication/otp.dart';

import 'package:validators/validators.dart';

class SignupController extends ChangeNotifier {
  bool passwordishiden1 = true;
  bool email_is_valid = true;

  bool passwordishiden2 = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  bool _loading = false;
  bool get loading => _loading;
  String? userid;
  togglepasswordviewsignUp() {
    passwordishiden1 = !passwordishiden1;
    notifyListeners();
  }

  togglepassword2view() {
    passwordishiden2 = !passwordishiden2;
    notifyListeners();
  }

  void ismailisValid(value) {
    email_is_valid = isEmail(value);
    notifyListeners();
  }

  //signupfn
  Future sighnUp(c) async {
    _loading = true;
    notifyListeners();
    userid = await SignUpservieces()
        .signupfuntion(name.text, password1.text, email.text, c);
    _loading = false;

    if (userid != null) {
      log(userid.toString());
      Navigator.of(c).pushReplacement(MaterialPageRoute(
          builder: (context) => Otp(
                email: email.text,
              )));
    }
    name.clear();
    email.clear();
    password1.clear();
    password2.clear();
  }


}

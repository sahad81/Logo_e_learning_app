import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/model/login/login.dart';

import 'package:logo_e_learning/src/ui/entry/user_sercies.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/provider_courses.dart';
import 'package:logo_e_learning/src/widgets/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class Authentication extends ChangeNotifier {
  bool passwordishiden = false;
  bool passwordishideniSignup = false;
  bool email_is_valid = false;

  Map<String, dynamic>? _userDetails;

  Map<String, dynamic> get userDetails {
    return _userDetails!;
  }

  TextEditingController email_controler = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  Future loginpostfunction(
    context,
  ) async {
    try {
      final response = await Dio().post(
        "$BaseUrl/user/login",
        data: LoginModel(
                email: email_controler.text, password: password_controller.text)
            .toJson(),
        options: Options(
          headers: <String, String>{
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        showSnackBar("Login Successfully completed", Colors.green, context);
        log("seccess");
        UserServieces().storeUserDetails(response.data);

        email_controler.clear();
        password_controller.clear();

        Provider.of<ProviderCoursess>(context).GetAllCourses(context);
        notifyListeners();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Screenmainpage()));
      }
    } on SocketException {
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );

      //Handling timeout error---------->

    } on TimeoutException {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: AlertDialog(
            content: Text('some server issues'),
          ),
        ),
      );
    } on DioError catch (e) {
      if (e.response == null) {
        showSnackBar(
            "server problem please try again later", Colors.red, context);
      } else if (e.response!.statusCode == 554) {
        showSnackBar("User not found", Colors.red, context);
      } else if (e.response!.statusCode == 554) {
        showSnackBar("Wrong Password", Colors.red, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), Colors.red, context);
    }
  }

  togglepasswordviewlogin() {
    passwordishiden = !passwordishiden;
    notifyListeners();
  }

  togglepasswordviewsignUp() {
    passwordishideniSignup = !passwordishideniSignup;
    notifyListeners();
  }

  void ismailisValid(value) {
    email_is_valid = isEmail(value);
    notifyListeners();
  }

  changescreen(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? result = prefs.getBool('isLoggedIn');
    Future.delayed(const Duration(seconds: 3)).whenComplete(
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            // ignore: unrelated_type_equality_checks
            builder: (context) {
          return Screenmainpage();
        }),
      ),
    );
  }
}

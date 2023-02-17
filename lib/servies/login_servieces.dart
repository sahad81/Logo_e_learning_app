// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/controllers/provider_authentication.dart';

import 'package:logo_e_learning/model/login.dart';
import 'package:logo_e_learning/view/mainpage/screen_main_page.dart';

import '../controllers/shared_prefs_servieses.dart';

class LoginServices {
  Future<LoginModel?> loginpostfunction(
      String email, String password, BuildContext context) async {
    try {
      final response = await Dio()
          .post(
            "$BaseUrl/user/login",
            data: LoginModel(email: email, password: password).toJson(),
            options: Options(
              headers: <String, String>{
                "Content-Type": "application/json",
              },
            ),
          )
          .timeout(
            const Duration(seconds: 7),
          );
      if (response.statusCode == 200) {
        showSnackBar("Login Successfully completed", Colors.green, context);
        log("seccess");
        UserServieces.emailsever(email);
        Authentication().getimail();

        //     return response.data;
        //------------storing email and user details----------------->
        UserServieces().storeUserDetails(response.data).then((value) =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Screenmainpage())));
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
      showSnackBar("No internet connection", Colors.red, context);

      //-----------types of response ------------>
    } on DioError catch (e) {
      if (e.response == null) {
        showSnackBar(
            "server problem please try again later", Colors.red, context);
      } else if (e.response!.statusCode == 554) {
        showSnackBar("User not found", Colors.red, context);
      } else if (e.response!.statusCode == 403) {
        showSnackBar("Wrong Password", Colors.red, context);
      }
    } catch (e) {
      showSnackBar("No internet", Colors.red, context);
    }
    return null;
  }
}

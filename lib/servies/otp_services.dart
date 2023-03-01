import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';
import '../const/widgets/snackbar.dart';

class OtpServiece {
  postotp(userId, otp, context) async {
    Dio dio = Dio();
    try {
      final response = await dio
          .post("$BaseUrl/user/verifyOtp",
              data: jsonEncode({"userId": userId, "otp": otp}))
          .timeout(
            const Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return response.data;
      }
      //Handling timeout SocketException---------->
    } on SocketException {
      log("SocketException");
      showSnackBar("No internet", Colors.red, context);
      //Handling timeout error---------->
    } on TimeoutException {
      showSnackBar("No internet", Colors.red, context);
      //-----------types of response ------------>
    } on DioError catch (e) {
      if (e.response == null) {
        showSnackBar("No internet", Colors.red, context);
      } else if (e.response!.statusCode == 400) {
        showSnackBar("The OTP you've enterd is incorret.Please try again",
            Colors.red, context);
      }
    } catch (e) {
      showSnackBar("No internet", Colors.red, context);

      log("fuck");
    }
  }
}

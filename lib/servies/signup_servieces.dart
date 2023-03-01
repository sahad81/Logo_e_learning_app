import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';

import '../const/widgets/snackbar.dart';

class SignUpservieces   {


  Future signupfuntion(name,paswrd,email,BuildContext context) async {
try {

      final response = await Dio()
        .post(
          "$BaseUrl/user/signup",
          data:jsonEncode({
            "name":name,
            "password":paswrd,
            "email":email
          }), 
          options: Options(
              headers: <String, String>{
                "Content-Type": "application/json",
              },
            ),
            
        )
        .timeout(
          const Duration(seconds: 10),
        );
      log("d");
      log(response.statusCode.toString());
        if (response.statusCode==200) {
        var id=response.data["userId"];
       return id;
        
      
       

        }
       }
        on SocketException {
 log("stockex");

      //Handling timeout error---------->
    } 
    on TimeoutException {
     
  showSnackBar("No internet", Colors.red, context);
      //-----------types of response ------------>
    }
on DioError catch (e) {
      if (e.response == null) {
        showSnackBar(
            "server problem please try again later", Colors.red, context);
      } else if (e.response!.statusCode == 554) {
        showSnackBar("User not found", Colors.red, context);
      } else if (e.response!.statusCode == 403) {
        showSnackBar("Wrong Password", Colors.red, context);
      }
       else if (e.response!.statusCode == 500) {
        showSnackBar("email is allrady exist", Colors.red, context);
      }
    } catch (e) {
      showSnackBar("No internet", Colors.red, context);
    }
   log("fuck");
  
  } 
  } 


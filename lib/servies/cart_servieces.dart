// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/model/getcart_model.dart';

import '../const/widgets/showdialogs.dart';
import '../const/widgets/snackbar.dart';
import '../controllers/shared_prefs_servieses.dart';

class CartServieces {
//===============================================add to cart   postfuntion====================================\\
  addtocart(String id, context) async {
    try {
      final tocken = await UserServieces.getToken();

      final response = await Dio().post(
        "$BaseUrl/user/addToCart",
        data: {"courseId": id},
        options: Options(
          headers: {"Authorization": tocken},
        ),
      ); //
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar("Successfully added to Cart", Colors.green, context);
        GetCartServieces(context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response == null) {
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist in Cart", Colors.red, context);
      }
    } catch (e) {
      showSnackBar("No internet connection", Colors.red, context);
    }
  }
  //======================================get cartsList=====================================\\

  Future GetCartServieces(context) async {
    try {
      Dio dio = Dio();
      final tocken = await UserServieces.getToken();

      final response = await dio.get("$BaseUrl/user/getCart",
          options: Options(headers: {
            "Authorization": tocken,
          
          }));
           final  carts = CartModel.fromJson(response.data);
           log(carts.toString());
          return carts;
    } on SocketException {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return ;
    } on TimeoutException {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return ;
    } on DioError {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return;
    } catch (e) {
      
   
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the interen");
            return ;
    }
  }
//-----------------------------------------remove from carts=========================================\\
   RemoveFromCart(String id, context) async {
    try {
      final tocken = await UserServieces.getToken();

      final response = await Dio().delete(
        "$BaseUrl/user/removeFromCart/$id",
        options: Options(
          headers: {"Authorization": tocken},
        ),
      ); //
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar(
            "Successfully Removed from cart", Colors.green, context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response == null) {
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already Removed", Colors.red, context);
      }
    } catch (e) {
    log(e.toString());
    }
  }
}

// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, unused_catch_clause, unused_field, prefer_final_fields, avoid_print

import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:logo_e_learning/controllers/user_servieses.dart';

import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/model/getcart_model.dart';

import 'package:logo_e_learning/src/model/wishlist_model.dart';

import 'package:logo_e_learning/src/widgets/snackbar.dart';

class CartProvider extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading;
  bool get eroor => _error;
  List<CartModel> cartList = [];

  bool checkinCart(id) {
    bool isinCart = false;
    log(cartList.length.toString());
    for (int i = 0; i < cartList[0].data!.length; i++) {
      if (cartList[0].data![i].courses == id) {
        isinCart = true;
        log(isinCart.toString());
      }
    }

    return isinCart;
  }

//===============================================add to cart====================================\\
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
        GetCartslist(context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response == null) {
        log(" no internet ");
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist in Cart", Colors.red, context);
      }
    } catch (e) {
      log(e.toString());
    }
  }
  //======================================get cartsList=====================================\\

  GetCartslist(context) async {
    _loading = true;
    _error = false;
    notifyListeners();

    try {
      Dio dio = Dio();
      final tocken = await UserServieces.getToken();

      final Response = await dio.get("$BaseUrl/user/getCart",
          options: Options(headers: {
            "Authorization": tocken,
          }));
      log(Response.statusCode.toString());
      if (Response.statusCode == 200 || Response.statusCode == 201) {
        cartList.clear();

        final data = CartModel.fromJson(Response.data);
        cartList.add(data);
        log(cartList.toString());

        log(cartList.toString());
        _loading = false;
        notifyListeners();
      }
    } on SocketException {
      _loading = false;
      _error = false;
      notifyListeners();
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      _loading = false;
      _error = true;
      notifyListeners();
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      _loading = false;
      _error = true;
      notifyListeners();
      showSnackBar("No internet connection", Colors.red, context);
    } catch (e) {
      print(e.toString());
    }
  }

//-----------------------------------------remove from carts=========================================\\
  void RemoveFromCart(String id, context) async {
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
            "Successfully Removed from Wishlist", Colors.green, context);

        GetCartslist(context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response == null) {
        log("no internet");
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already Removed", Colors.red, context);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

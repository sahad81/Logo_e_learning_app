// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, unused_catch_clause

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/model/model_getWishlist.dart';
import 'package:logo_e_learning/src/ui/entry/user_sercies.dart';
import 'package:logo_e_learning/src/widgets/snackbar.dart';

class WishListP extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading;
  bool get eroor => _error;
  List WishlistG = [];
  static AddToWishlist(String id, context) async {
    try {
      final tocken = await UserServieces.getToken();

      final response = await Dio().post(
        "$BaseUrl/user/addToWishlist",
        data: {"courseId": id},
        options: Options(
          headers: {"Authorization": tocken},
        ),
      ); //
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar("Successfully added to Wishlist", Colors.green, context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response!.statusCode == null) {
        showSnackBar("somthing Wrong", Colors.red, context);
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist", Colors.red, context);
      }
    }
  }

  GetWishlist(context) async {
    _loading = true;
    _error = false;
    notifyListeners();

    try {
      Dio dio = Dio();
      final tocken = await UserServieces.getToken();

      final Response = await dio.get("$BaseUrl/user/getWishlists",
          options: Options(headers: {
            "Authorization": tocken,
          }));
      if (Response.statusCode == 200 || Response.statusCode == 201) {
        WishlistG.clear();
        final data = GetWishlistModel.fromJson(Response.data);
        WishlistG.add(data.data);
        notifyListeners();
        log(WishlistG.toString());
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
    }
  }
}

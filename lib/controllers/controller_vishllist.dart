// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, unused_catch_clause, unused_field, prefer_final_fields

import 'dart:async';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:logo_e_learning/controllers/user_servieses.dart';


import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/model/wishlist_model.dart';


import 'package:logo_e_learning/src/widgets/snackbar.dart';

class WishListP extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading;
  bool get eroor => _error;
  List<WishlistModel> WishlistG = [];
  List<Datum> datas = [];
  bool checkifinWishlistorNot(id) {
    bool inwishlist = false;

    for (int i = 0; i < WishlistG[0].data.length; i++) {
      if (WishlistG[0].data[i].courses == id) {
        inwishlist = true;
       
      }
    }

    return inwishlist;
  }

//===============================================addTowishlist====================================\\
  AddToWishlist(String id, context) async {
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
        GetWishlist(context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);

    } on DioError catch (e) {
      if (e.response == null) {
     log(" no internet ");
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist", Colors.red, context);
      }
    } catch (e) {
      log(e.toString());
    }
  }
  //======================================getingWishlist=====================================\\

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
          log(Response.statusCode.toString());
      if (Response.statusCode == 200 || Response.statusCode == 201) {
        WishlistG.clear();
        datas.clear();
        final data = WishlistModel.fromJson(Response.data);
        WishlistG.add(data);
        datas.addAll(data.data);
      
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
    catch (e){
      log(e.toString());
    }
  }

//-----------------------------------------remove from wishlist=========================================\\
  void RemoveFromWishlist(String id, context) async {
    try {
      final tocken = await UserServieces.getToken();

      final response = await Dio().delete(
        "$BaseUrl/user/removeFromWishlist/$id",
        options: Options(
          headers: {"Authorization": tocken},
        ),
      ); //
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar(
            "Successfully Removed from Wishlist", Colors.green, context);

        GetWishlist(context);
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

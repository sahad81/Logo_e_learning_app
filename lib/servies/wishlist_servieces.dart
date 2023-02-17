// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/controllers/shared_prefs_servieses.dart';
import 'package:logo_e_learning/model/wishlist_model.dart';

class WishlistServieces {
  Future GetWishlists(context) async {
    try {
      Dio dio = Dio();
      final tocken = await UserServieces.getToken();

      final Response = await dio
          .get("$BaseUrl/user/getWishlists",
              options: Options(headers: {
                "Authorization": tocken,
              }))
          .timeout(const Duration(seconds: 15));
      log(Response.statusCode.toString());
      if (Response.statusCode == 200 || Response.statusCode == 201) {
        final data = WishlistModel.fromJson(Response.data);
        return data;
      }
    } on SocketException {
      return;
    } on TimeoutException {
      return;
    } on DioError {
      return;
    } catch (e) {
      return;
    }
  }

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
      }
    } on SocketException {
      log("erro");
    } on TimeoutException {
      log("erro");
    } on DioError catch (e) {
      if (e.response == null) {
        log(" no internet ");
        showSnackBar("No internet ", Colors.red, context);
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist", Colors.red, context);
      }
    } catch (e) {
      showSnackBar("No Internet ", Colors.red, context);
    }
  }

  Future RemoveFromWishlist(String id, context) async {
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
      showSnackBar("No internet connection", Colors.red, context);
    }
  }
}

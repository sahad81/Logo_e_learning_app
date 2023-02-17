// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, unused_catch_clause, unused_field, prefer_final_fields

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logo_e_learning/controllers/shared_prefs_servieses.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/servies/wishlist_servieces.dart';
import '../model/wishlist_model.dart';

class WishListP extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading;
  bool get eroor => _error;
  List<WishlistModel> WishlistG = [];

//-------------------------checking coures in wishlist or not in wishlist-------------------->
  bool checkifinWishlistorNot(id) {
    bool inwishlist = false;
    for (int i = 0; i < WishlistG[0].data.length; i++) {
      if (WishlistG[0].data[i].courses == id) {
        inwishlist = true;
      }
    }
    return inwishlist;
  }
  //======================================getingWishlist=====================================\\

  GetWishlist(context) async {
    _loading = true;  
    _error = false;
    WishlistG.clear();

    final data = await WishlistServieces().GetWishlists(context);
    if (data == null) {
      _loading = true;
      _error = true;
      notifyListeners();
    } else {
      WishlistG.add(data);
      _loading = false;
      notifyListeners();
    }
  }

//===============================================addTowishlist====================================\\
  AddToWishlist(String id, context) async {
    await WishlistServieces().AddToWishlist(id, context);
    GetWishlist(context);
  }

//-----------------------------------------remove from wishlist=========================================\\
  void RemoveFromWishlist(String id, context) async {
    WishlistServieces().RemoveFromWishlist(id, context);
    GetWishlist(context);
  }
}

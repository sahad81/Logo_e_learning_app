import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/model/UserDetails_model.dart';
import 'package:logo_e_learning/servies/userprofile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  List<UserDetailsModel> userDetailslist = [];

  bool allfnloading = false;
  bool errorforallfn = false;

  bool get loading => _loading;
  bool get eroor => _error;
  Future<void> getUserDetails() async {
    _loading = true;
    _error = false;
    notifyListeners();
    final data = await UserDetailsServices().getUserDetails();
    if (data != null) {
      userDetailslist.clear();
      userDetailslist.add(data);
      log("userDetaiils get $userDetailslist");
//log(userDetailslist[0].userDetails.toString());
      _loading = false;
      notifyListeners();
    } else {
      log("userdaetail null");
      _error = true;
      _loading = false;
      notifyListeners();
    }
  }

  initfuntions(context) async {
    allfnloading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? b = prefs.getBool("'userdatageted");

    if (b == true && Provider.of<WishListP>(context).WishlistG.isEmpty) {
      log("sett");
    } else {
      getUserDetails();
      //   initfuntions();
      notifyListeners();
    }
  }
}

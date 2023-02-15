import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/controllers/shared_prefs_servieses.dart';
import 'package:logo_e_learning/model/UserDetails_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends ChangeNotifier {
  List<UserDetailsModel> userDetatailss = [];
   bool _error = false;
  bool _loading = false;
  String _errorMessage = '';
  bool allfnloading=false;
  bool errorforallfn=false;

  bool get loading => _loading;
  bool get eroor => _error;
  Future<void> getUserDetails() async {
    try {
      _loading=true;
      notifyListeners();
      final tocken = await UserServieces.getToken();

      final Response = await Dio().get("$BaseUrl/user/userProfile",
          options: Options(
            headers: {"Authorization": tocken},
          ));
      if (Response.statusCode == 200 || Response.statusCode == 201) {
   
        
        print(userDetatailss);
      
        _loading=false;
        
      }
    } on SocketException {
      print("eroor inernet");

       _loading = false;
       _error = true;
       notifyListeners();
    } on TimeoutException {
     _loading = false;
       _error = true;
       notifyListeners();
      print("eroor=timeout");
    } on DioError catch (e) {
       _loading = false;
       _error = true;
       notifyListeners();
      print("eroor$e");
    } catch (e) {
       _loading = false;
       _error = true;
       notifyListeners();
      print("$e.eroor");
    }
  }








initfuntions(context)async{
  allfnloading=true;
  notifyListeners();
           SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? b = prefs.getBool("'userdatageted");

      if (b==true&&Provider.of<WishListP>(context).WishlistG.isEmpty) {
        log("sett");
      } else {
      getUserDetails();
   //   initfuntions();
        notifyListeners();
      }
}

}

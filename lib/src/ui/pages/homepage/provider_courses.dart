// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:logo_e_learning/src/const/strings.dart';

import 'package:logo_e_learning/src/model/courses.dart';
import 'package:logo_e_learning/src/widgets/snackbar.dart';

class ProviderCoursess with ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  ValueNotifier<List<CouressModel>> courseNotifire = ValueNotifier([]);

  String get Errormsg => _errorMessage;
  bool get loading => _loading;
  bool get eroor => _error;

  Future<void> GetAllCourses(BuildContext context) async {
    try {
      _loading = true;
      _error = false;
      _loading = true;
      _errorMessage = "";
     
      notifyListeners();

      final response = await http
          .get(
           Uri.parse( '$BaseUrl/user/getCourses/:index',)
          )
          .timeout(const Duration(seconds: 10));
//======== statusCode chacking============================================//
      if (response.statusCode == 200) {
        log("success");

        final data = couressModelFromJson(response.body);
       
        courseNotifire.value.clear();
        courseNotifire.value.addAll(data);
        courseNotifire.notifyListeners;
        _loading = false;
        notifyListeners();

        log(courseNotifire.value.length.toString());
        notifyListeners();
      } else {
        log('error');
        _loading = false;
        _error = true;
        _errorMessage = "Somthing wrong";
        notifyListeners();
      }

      //=======Error============//
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        _loading = false;
        _error = true;
        _errorMessage = e.toString();
        _error = true;
        notifyListeners();
      } else {
        _loading = false;
        _error = true;
        _errorMessage = e.toString();

      notifyListeners();
        showSnackBar(e.toString()=="Connection failed"?"No internet":e.toString(), Colors.red, context);
       
      }
    }
  }
}

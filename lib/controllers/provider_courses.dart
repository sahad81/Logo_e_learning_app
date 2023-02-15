// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import '../model/courses_model.dart';

class ProviderCoursess with ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  List<CouressModel> allCourse = [];
  List<CouressModel> Design = [];
  List<CouressModel> Finance = [];
  List<CouressModel> IT = [];
  List<CouressModel> Marketing = [];
  List<CouressModel> MubailDevelopment = [];
  List<CouressModel> bussiness = [];
  List<CouressModel> Development = [];
  List<CouressModel> categoryselectedlist = [];

  String get Errormsg => _errorMessage;
  bool get loading => _loading;
  bool get eroor => _error;
  String selectedcategory = "";

  filter(context) {
    log("h");
    categoryselectedlist.clear();
MubailDevelopment.clear();
     GetAllCourses(context).whenComplete(() {


        notifyListeners();
   
      if (selectedcategory == "Mubail Development") {
        categoryselectedlist = MubailDevelopment;
        notifyListeners();
        log("${categoryselectedlist.length.toString()}length of mubaiil development");
      }
      else{
        categoryselectedlist.clear();
        log(categoryselectedlist.length.toString());
        notifyListeners();
      }

     }
    
    
    );
  
    
  }

//--------------------------getting all courses--------------------------->
  Future<void> GetAllCourses(BuildContext context) async {
    try {
      _loading = true;
      _error = false;
      _loading = true;
      _errorMessage = "";

      notifyListeners();

      final response = await http
          .get(Uri.parse(
            '$BaseUrl/user/getCourses/:index',
          ))
          .timeout(const Duration(seconds: 20));
//======== statusCode chacking============================================//
      if (response.statusCode == 200) {
        log("success");

        final data = couressModelFromJson(response.body);

        allCourse.clear();
        allCourse.addAll(data);

        _loading = false;
        notifyListeners();
        MubailDevelopment.clear();
        for (var i = 0; i < data.length; i++) {
          if (data[i].category == "MubailDevelopment") {
            MubailDevelopment.add(data[i]);
//log(MubailDevelopment.length.toString());
          }
        }
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
        showSnackBar(
            e.toString() == "Connection failed" ? "No internet" : e.toString(),
            Colors.red,
            context);
      }
    }
  }
}

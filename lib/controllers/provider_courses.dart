// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/view/homepage/categorie_view_page.dart';

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
  List<CouressModel> MobileDevelopment = [];
  List<CouressModel> bussiness = [];
  List<CouressModel> Development = [];
  List<CouressModel> Recommended_For_You_List = [];
  List<CouressModel> categoryselectedlist = [];
  List<String> categoryList = [];

  String get Errormsg => _errorMessage;
  bool get loading => _loading;
  bool get eroor => _error;
  String selectedcategory = "";

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
          .timeout(const Duration(seconds: 15));
//======== statusCode chacking============================================//
      if (response.statusCode == 200) {
        log("success");

        final data = couressModelFromJson(response.body);

        allCourse.clear();
        allCourse.addAll(data);

        _loading = false;
        notifyListeners();
        MobileDevelopment.clear();
        bussiness.clear();
        Finance.clear();
        Marketing.clear();
        Recommended_For_You_List.clear();
//--------------------------------filtering for categories-------------------------------->

        categoryList.clear();
        allCourse.map((e) => e.category).toSet().forEach((element) {
          categoryList.add(element!);
        });
        
        for (var i = 0; i < data.length; i++) {
          if (data[i].category == "IT" ||
              data[i].category == "Mobile Development") {
            Recommended_For_You_List.add(data[i]);
            if (data[i].category == "Mobile Development") {
              MobileDevelopment.add(data[i]);
            }
          } else if (data[i].category == "Business") {
            bussiness.add(data[i]);
            log(bussiness.length.toString());
          } else if (data[i].category == "Marketing") {
            Marketing.add(data[i]);
            log(bussiness.length.toString());
          } else if (data[i].category == "Finance") {
            Finance.add(data[i]);
          }
        }
      } else {
        log('error');
        _loading = false;
        _error = true;
        _errorMessage = "Somthing wrong";
        notifyListeners();
      }

      //=======Error============----------------------------------------//
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
  
//---------------------------------------filtering --------------------------------------------->

  filter(BuildContext bcontext, String category) async {
    categoryselectedlist.clear();

    notifyListeners();

    if (selectedcategory == "Mobile Development") {
      categoryselectedlist = List.from(MobileDevelopment);
      log(MobileDevelopment.length.toString());
      notifyListeners();
      log("${categoryselectedlist.length.toString()}length of mobile development");
    } else if (selectedcategory == "Design") {
      categoryselectedlist.addAll(Design);
      notifyListeners();
    } else if (selectedcategory == "IT") {
      categoryselectedlist = List.from(Recommended_For_You_List);
      notifyListeners();
    } else if (selectedcategory == "Business") {
      categoryselectedlist.addAll(bussiness);
      notifyListeners();
    } else if (selectedcategory == "Marketing") {
      categoryselectedlist.addAll(Marketing);
      notifyListeners();
    } else if (selectedcategory == "Finance") {
      categoryselectedlist.addAll(Finance);
      notifyListeners();
    }

    Navigator.of(bcontext).push(MaterialPageRoute(
      builder: (context) => CategoryPage(category: category),
    ));
  }

}

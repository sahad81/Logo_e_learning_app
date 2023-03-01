// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/model/mycourses.dart';
import 'package:logo_e_learning/servies/my_learnings.dart';

class MyLearningsController extends ChangeNotifier {
  bool _loading = false;
  bool _error = false;
  bool get error => _error;
  bool get loading => _loading;
  List<MyCoursesModel> myCourses = [];

  MyLearningsModules() async {
    _loading = true;
    _error = false;
    notifyListeners();
    final data = await MyLearningServices().getMycourses();
    if (data == null) {
      _loading = false;
      _error = true;
      notifyListeners();
    } else {
      log("my learning set");
      myCourses.add(data);
      _loading = false;
      notifyListeners();
    }
  }

  void initfuntion() {
    if (_error || myCourses.isEmpty) {
      MyLearningsModules();
    }
  }
}

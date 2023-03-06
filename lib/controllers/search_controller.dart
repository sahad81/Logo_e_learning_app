// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:logo_e_learning/model/search_model.dart';
import 'package:logo_e_learning/servies/searching_servieces.dart';

class SearchController extends ChangeNotifier{
  bool _loading=false;
  bool get loading =>_loading;
  bool _error=false;
  bool get error=>_error;

List<SearchModel> datas=[];
Future getsearchedCourses(String value)async{
  _loading=true;
  _error=false;
  notifyListeners();
  final  data= await SearchingServieces().fetchSearchedData(value);
  if (data!=null) {
    datas.clear();
    datas.add(data);
    _loading=false;
    notifyListeners();
    
  }
  else{
    _loading=false;
    _error=true;
    notifyListeners();
      }


}

}
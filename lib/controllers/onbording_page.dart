

import 'dart:developer';

import 'package:flutter/material.dart';

class OnbordingController extends ChangeNotifier{
bool islastpage=false;
 void checklastPage (index){
  islastpage=false;
  notifyListeners();
islastpage=index==2;
log(islastpage.toString());
notifyListeners();

  }

  tofirst(){
    islastpage=false;
    
    notifyListeners();
  log(islastpage.toString());
  }
}
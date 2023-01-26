
// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/model/login/login.dart';
import 'package:validators/validators.dart';

class Authentication extends ChangeNotifier{
bool passwordishiden=false;
bool passwordishideniSignup=false;
 bool email_is_valid = false;

LoginAuth(String email,String password)async{

final Response=await Dio().post("$BaseUrl/user/login",data: 
  LoginModel(email:email,password: password )



);



}























togglepasswordviewlogin(){
  passwordishiden=!passwordishiden;
  notifyListeners();
}
togglepasswordviewsignUp(){
  passwordishideniSignup=!passwordishideniSignup;
  notifyListeners();
}

void  ismailisValid(value){
       email_is_valid  = isEmail(value);
       notifyListeners();
}

}
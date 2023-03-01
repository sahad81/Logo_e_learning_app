import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:validators/validators.dart';

class Feadbackprovider extends ChangeNotifier {

  bool focusedmsg = false;
  bool focusname = false;
  bool focusmail = false;
  bool focusedsub = false;
  final namecontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final messagecontroler = TextEditingController();
  final subcontroler = TextEditingController();
 

 bool isemailcorrect = false;
  bool subcontrolercrt = false;
  bool messagecontrolercrt = false;
  bool suffixchange = false;
  bool isnameiscrt = false;


  void focusnametrfn(bool value){
    focusname=value;
    notifyListeners();
  }
    void focusmailfn(bool value){
    focusmail=value;
    notifyListeners();
  }
  void focussubfn(bool value){
    focusedsub=value;
    notifyListeners();
  }
    void focusmsgfn(bool value){
    focusedmsg=value;
    notifyListeners();
  }
   onpressed(bool value){
       focusedmsg = value;
   focusname = value;
   focusmail = value;
   focusedsub = value;
notifyListeners();
  }
void  isnameiscrfn(value){
       isnameiscrt = isByteLength(value, 2, 15);
       notifyListeners();
}
void  ismailiscrtfn(value){
       isemailcorrect = isEmail(value);
       notifyListeners();
}
void issubiscrtfn(val){
   subcontrolercrt = isByteLength(val, 2, 40);
   notifyListeners();
}
void msgiscrtfn(val){
  messagecontrolercrt = isByteLength(val, 4, 100);
   notifyListeners();
} 
void  start(){
  messagecontrolercrt=false;
  subcontrolercrt=false;
  isemailcorrect=false;
  isnameiscrt=false;
}

  Future sendmail(BuildContext context) async {
    
    const sarviesid = "service_z0yu4o8";
    const tembletid = "template_ulumwq4";
    const userId = "O-a6sczZ-gerFnuAp";
    var responce = await Dio().post(feadbackUrl,
      options: Options(
          headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
      ),
        data: json.encode(
          {
            "service_id": sarviesid,
            "template_id": tembletid,
            "user_id": userId,
            "template_params": {
              "name": namecontroler.text,
              "message": messagecontroler.text,
              "user_email": emailcontroler.text,
            }
          },
        ));

    /// ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 5),
      content: Text('Email Sending succesfully competed'),
      backgroundColor: Colors.green,
    ));
    return responce.statusCode;
  }
}
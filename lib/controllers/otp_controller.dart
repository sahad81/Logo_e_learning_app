
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/controllers/signup_controller.dart';
import 'package:logo_e_learning/servies/otp_services.dart';
import 'package:logo_e_learning/view/Authentication/login_page.dart';
import 'package:provider/provider.dart';

class OtpController extends ChangeNotifier{
  bool loading= false;
    TextEditingController otp =TextEditingController();
    otpfn(BuildContext context)async{
    loading =true;
    notifyListeners();

      final usid=Provider.of<SignupController>(context,listen: false).userid;
      log(usid.toString());
final verified=     await OtpServiece().postotp(usid, otp.text, context);
otp.clear();
loading=false;
notifyListeners();
    if (verified!=null) {
      // ignore: use_build_context_synchronously
      showSnackBar("Succesfully Registered", Colors.green, context);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
      
    } 

  }

}
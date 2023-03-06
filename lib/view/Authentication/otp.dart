
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/controllers/otp_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
class Otp extends StatelessWidget {
  const Otp({super.key, this.email});
// ignore: prefer_typing_uninitialized_variables
final email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 190, 177, 177),
        elevation: 0,
          leading: const BackButton(
    color: Colors.black, // <-- SEE HERE
  ),
  centerTitle: true,
)
      ,
      body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.blue.shade200],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(children: [
                
                     const SizedBox(
                  height: 20,
                              ),
                              SvgPicture.asset(
                                      "assets/undraw_mail_sent_re_0ofv.svg",height: 100,width: 100,fit: BoxFit.fitHeight,
                                    ),
                              const SizedBox(
                  height: 24,
                              ),
                              const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                              ),
                              const SizedBox(
                  height: 10,
                              ),
                          Ktext(text: "Please enter the verification code that we sent to your email $email",
                           color: Colors.black, size: 14,textalie: TextAlign.center,
                           
                           )
                              ,
                              const SizedBox(
                  height: 28,
                              ),
                              
                           
                
                    
                Pinput(
                  length: 4,

                  controller:context.read<OtpController>().otp,
                
                  onCompleted: (value) {
                    log(value.toString());
                     context.read<OtpController>().otpfn(context);
                  },
                ),
                    const Expanded(child: SizedBox()),
                  InkWell(
                                onTap: () {
if (context.read<OtpController>().otp.length<4) {
   showSnackBar("The OTP you've enterd is incorret.Please try again", Colors.red, context);

  
} else {
  context.read<OtpController>().otpfn(context);
}
                                },
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                  height: 55.0,
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.blue.shade900,
                  ),
                  child: Consumer<OtpController>(
                    builder: (context, value, child) {
                      
                    
                    return  Center(
                      child:
                      value.loading==true?const CircularProgressIndicator():
                       const Ktext(text: "Verify", color: Colors.white, size:  15,weight: FontWeight.bold,),
                      );
                    })
                  )
                  ),
                              const SizedBox(
               height: 20,
              ),
                  ]),
                  
                ),

      ),
     ) );
  }
}
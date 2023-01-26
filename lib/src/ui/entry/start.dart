import 'package:flutter/material.dart';

import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/entry/login_page.dart';
import 'package:logo_e_learning/src/ui/entry/signup_page.dart';

class Selectionpage extends StatelessWidget {
  const Selectionpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size1=MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white,  Colors.blue.shade200],
      )),
      child: Column(children: [
        SizedBox(
          width: 300,
          height: 400,
          child:Center(child: Ktext(text: "icon ", color: Colors.black, size: 30))
          //  SvgPicture.asset(
          //   "assets/undraw_learning_sketching_nd4f (1).svg",
          //   width: 20,
          // ),
        ),
        Ktext(
            text: "Space Class",
            color: kblueGray,
            size: size1*0.04,
            weight: FontWeight.bold),
        Ktext(text: "Set your career goal!!", color: kblueGray, size: size1*0.02,),
        kheight30,
        Expanded(
          child: Stack(
            children: [
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  LoginPage()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: size1*0.070 ,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.blue.shade900,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Center(
                                child: Ktext(
                              text: "Log in",
                              color: kwite,
                              size: size1*0.026,
                              weight: FontWeight.w600,
                            )),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: size1*0.070,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.blue.shade900,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            alignment: Alignment.center,
                            child: Ktext(
                              text: "Sign In",
                              color: kwite,
                              size: size1*0.025  ,
                              weight: FontWeight.w600,
                            )),
                      ),
                    ),

                    //  KsighnWith__(),
                    //  KsighnWith__()
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    )));
  }
}

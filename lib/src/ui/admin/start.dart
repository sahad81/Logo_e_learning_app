
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/admin/login_page.dart';
import 'package:logo_e_learning/src/ui/admin/signup_page.dart';

class Selectionpage extends StatelessWidget {
  const Selectionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Color.fromARGB(255, 131, 151, 161)
        ],
      
      )
      ),
      child: Column(children: [
   
        SizedBox(
          width: 300,
          height: 400,
          child: SvgPicture.asset(
            "assets/undraw_learning_sketching_nd4f (1).svg",width: 20,
          ),
        ),
        Ktext(text: "L  O  G  O", color: kblueGray, size: 35,weight: FontWeight.bold),
        Ktext(text: "Set your career goal!!", color: kblueGray, size: 16),
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
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                      child: GestureDetector(
                        onTap:() {
                          
                        },
                        child: InkWell(
                              onTap: () {
                        Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => LoginPage()));  
                          
                        },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 57,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                   
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                            child: Center(
                                child: Ktext(
                              text: "Log in",
                              color: kwite,
                              size: 20,
                              weight: FontWeight.w600,
                            )),
                          ),
                        ),
                      ),
                    ),
                
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: InkWell(
                        onTap: () {
                        Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => SignUp()));  
                          
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width ,
                            height: 57,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.blueGrey,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            alignment: Alignment.center,
                            child: Ktext(
                              text: "Sign In",
                              color: kwite,
                              size: 20,
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

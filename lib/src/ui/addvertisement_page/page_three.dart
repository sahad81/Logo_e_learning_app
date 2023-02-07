import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';

import 'package:provider/provider.dart';

class Thirdapp extends StatelessWidget {
  const Thirdapp({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.043,
              right: MediaQuery.of(context).size.width * 0.043),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.blue.shade100,
            label: Ktext(text: "let's start", color: kblack, size: 20),
            onPressed: () {
              
              
              
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Screenmainpage(),
              ));
            },

            //   onPressed: () {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));

            // }
            // ,
          ),
        ),
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.blue.shade200],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(children: [
                    SizedBox(
                      height: size1 * 0.1,
                    ),
                    SizedBox(
                      height: size1 * 0.23,
                      child: SvgPicture.asset(
                        "assets/undraw_agreement_re_d4dv.svg",
                      ),
                    ),
                    SizedBox(
                      height: size1 * 0.03,
                    ),
                    Ktext(
                      text: "Get job from Us",
                      color: kblack,
                      size: MediaQuery.of(context).size.width * 0.07,
                      weight: FontWeight.bold,
                    ),
                    kheight15,
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 08),
                        child: Ktext(
                          text:
                              " you can start a career after completing a course on Space Class. The courses provided on Space Class are designed to teach students the fundamental skills they need to upskill and enter into specific fields at entry level.",
                          color: kblack,
                          size: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    ),
                   ]),
                ))));
  }
}

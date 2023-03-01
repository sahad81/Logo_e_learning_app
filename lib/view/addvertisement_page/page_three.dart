import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

class OnbordingScreenn3 extends StatelessWidget {
  const OnbordingScreenn3({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(color: Colors.blue.shade100),
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

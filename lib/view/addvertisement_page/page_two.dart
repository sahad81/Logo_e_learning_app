import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/view/addvertisement_page/page_three.dart';
class OnbordingScreenn2 extends StatelessWidget {
  const OnbordingScreenn2({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
     
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                color: Colors.blue.shade100
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
                        "assets/undraw_stepping_up_g6oo (1).svg",
                      ),
                    ),
                    SizedBox(
                      height: size1 * 0.03,
                    ),
                    Ktext(
                      text: "Grow with our  Team",
                      color: kblack,
                      size: MediaQuery.of(context).size.width * 0.07,
                      weight: FontWeight.bold,
                    ),
                    kheight15,
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Ktext(
                          text:
                              "Encourage  your academic performance, career, and quality of life. You will be able to accomplish your objective after your course is complete.",
                          color: kblack,
                          size: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

class OnbordingScreenn1 extends StatelessWidget {
  const OnbordingScreenn1({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
      
        body: SafeArea(
            child: Container(
             color: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(children: [
                    SizedBox(
                      height: size1 * 0.1,
                    ),
                    SizedBox(
                      height: size1 * 0.23,
                      child: SvgPicture.asset(
                        "assets/undraw_learning_sketching_nd4f (1).svg",
                      ),
                    ),
                    SizedBox(
                      height: size1 * 0.025,
                    ),
                    Ktext(
                      text: "Learn With Us",
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
                              "Find the right instructor for you. Choose from many topics, skill levels, and languages. Shop thousands of high-quality  on-demand online courses. Start learning today.",
                          color: kblack,
                          size: MediaQuery.of(context).size.width * 0.040,
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}

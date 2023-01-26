import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/addvertisement_page/page_three.dart';

class Second_add extends StatefulWidget {
  const Second_add({super.key});

  @override
  State<Second_add> createState() => _Second_addState();
}

class _Second_addState extends State<Second_add> {
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
            label: Ktext(text: "Next", color: kblack, size: 20),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Thirdapp(),
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
                      height: size1 * 0.23 ,
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

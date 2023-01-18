import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/addpage/secondadd.dart';
import 'package:logo_e_learning/src/ui/admin/start.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';

class Add_page extends StatelessWidget {
  const Add_page({super.key});

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
                builder: (context) => Second_add(),
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

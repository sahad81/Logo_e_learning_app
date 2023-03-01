import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/onbording_page.dart';
import 'package:logo_e_learning/view/Authentication/login_page.dart';
import 'package:logo_e_learning/view/addvertisement_page/page_one.dart';
import 'package:logo_e_learning/view/addvertisement_page/page_three.dart';
import 'package:logo_e_learning/view/addvertisement_page/page_two.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreenn extends StatelessWidget {
  OnbordingScreenn({super.key});

  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade100),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: PageView(
                onPageChanged: (value) {
                  Provider.of<OnbordingController>(context, listen: false)
                      .checklastPage(value);
                  log(value.toString());
                },
                controller: controller,
                children: const [
                  OnbordingScreenn1(),
                  OnbordingScreenn2(),
                  OnbordingScreenn3()
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Provider.of<OnbordingController>(context).islastpage ==
                      true
                  ? Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * 0.065,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                      (route) => false);
                                        controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                                Provider.of<OnbordingController>(context,
                                            listen: false)
                                        .tofirst();
                                    
                            
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue.shade900, // background color
                              // text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // button border radius
                              ),
                              elevation: 5, // button elevation
                            ),
                            child: const Text("Let's Start")),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            onDotClicked: (index) => controller.animateToPage(
                                index,
                                duration: const Duration(microseconds: 500),
                                curve: Curves.bounceInOut),
                            count: 3,
                            effect: WormEffect(
                                spacing: 7,
                                dotColor: Colors.blue,
                                activeDotColor: Colors.blue.shade900),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Ktext(
                                text: "Next",
                                color: Colors.blue.shade900,
                                size: 20))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}

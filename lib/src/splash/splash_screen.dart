import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/model/courses.dart';
import 'package:logo_e_learning/controlls/provider_authentication.dart';
import 'package:logo_e_learning/src/ui/entry/start.dart';
import 'package:logo_e_learning/controlls/provider_courses.dart';
import 'package:logo_e_learning/controlls/controller_vishllist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getdata(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blue.shade200],
          ),
        ),
        child:
            Center(child: Ktext(text: "Space Class", color: kblack, size: 27)),
      ),
    );
  }

  getdata(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? b = prefs.getBool("isLoggedIn");

    if (b == true) {
      Provider.of<ProviderCoursess>(context, listen: false)
          .GetAllCourses(context);
             Provider.of<WishListP>(context, listen: false)
          .GetWishlist(context);
      log("uers");
      Future.delayed(const Duration(seconds: 1)).whenComplete(
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              // ignore: unrelated_type_equality_checks
              builder: (context) {
            return Screenmainpage();
          }),
        ),
      );
    } else {
      log("not a user");
      Future.delayed(const Duration(seconds: 1)).whenComplete(
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              // ignore: unrelated_type_equality_checks
              builder: (context) {
            return Selectionpage();
          }),
        ),
      );
    }
  }
}

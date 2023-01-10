
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/mainpage/bottom_nav.dart';
import 'package:logo_e_learning/src/ui/pages/homepage.dart';
import 'package:logo_e_learning/src/ui/pages/learnigs.dart';
import 'package:logo_e_learning/src/ui/pages/my_account.dart';
import 'package:logo_e_learning/src/ui/pages/search_page.dart';
import 'package:logo_e_learning/src/ui/pages/wish_list.dart';

class Screenmainpage extends StatelessWidget {
  Screenmainpage({super.key});

  List list = [
     HomePage(),
    const SearchPage(),
    const LearningPage(),
    Wishlist(),
    MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ValueListenableBuilder(
        valueListenable: indexnotifire,
        builder: (context, page, child) {
          return list[page];
        },
      ),
      bottomNavigationBar: const BottomNavigationwidget(),
    );
  }
}

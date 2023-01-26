
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/mainpage/bottom_nav.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';
import 'package:logo_e_learning/src/ui/pages/learnings/learnigs.dart';
import 'package:logo_e_learning/src/ui/pages/account/my_account.dart';
import 'package:logo_e_learning/src/ui/pages/search/search_page.dart';
import 'package:logo_e_learning/src/ui/pages/wish_list/wish_list.dart';

// ignore: must_be_immutable
class Screenmainpage extends StatelessWidget {
  Screenmainpage({super.key});

  List list = [
     const HomePage(),
     Searchsreen(),
    const LearningPage(),
    const Wishlist(),
    const MyAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
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

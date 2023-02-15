
import 'package:flutter/material.dart';
import 'package:logo_e_learning/view/mainpage/bottom_nav.dart';
import 'package:logo_e_learning/view/homepage/homepage.dart';
import 'package:logo_e_learning/view/learnings/learnigs.dart';
import 'package:logo_e_learning/view/account/my_account.dart';
import 'package:logo_e_learning/view/search/search_page.dart';

import 'package:logo_e_learning/view/wish_list/wishlist_page.dart';

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

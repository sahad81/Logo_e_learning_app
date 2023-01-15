import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/grid_view.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  kwite,
         automaticallyImplyLeading: false,
         actions: [
         CartBtn()
         ],
        title: Ktext(text: "        Courses", color: kblack, size: 25)),
      body: Column(
       
          
          children: [Expanded(child: GridViewCard())]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/provider_courses.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/grid_view.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderCoursess>(context, listen: false).eroor == true
        ? Future.delayed(Duration(microseconds: 3)).then((value) =>
            Provider.of<ProviderCoursess>(context, listen: false)
                .GetAllCourses(context))
        : "";
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kwite,
          automaticallyImplyLeading: false,
          actions: [CartBtn()],
          title: Ktext(text: "        Courses", color: kblack, size: 25)),
      body: Column(children: [Expanded(child: GridViewCard())]),
    );
  }
}

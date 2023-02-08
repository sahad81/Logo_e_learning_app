import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

import 'package:logo_e_learning/src/ui/pages/homepage/widgets/grid_view.dart';

import 'package:logo_e_learning/src/widgets/cart_bn.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(microseconds: 3)).then((value) {
      Provider.of<WishListP>(context, listen: false).WishlistG.isEmpty
          ? Provider.of<WishListP>(context, listen: false).GetWishlist(context)
          : "";      Provider.of<ProviderCoursess>(context, listen: false).allCourse.isEmpty
          ? Provider.of<ProviderCoursess>(context, listen: false)
              .GetAllCourses(context)
          : "";

      Provider.of<CartProvider>(context, listen: false).cartList.isEmpty
          ? Provider.of<CartProvider>(context, listen: false).GetCartslist(context)
          : "";
    });

    return Scaffold(
      appBar: AppBar(
          backgroundColor: kwite,
          automaticallyImplyLeading: false,
          actions: const [CartBtn()],
          title: Ktext(text: "        Courses", color: kblack, size: 25)),
      body: Column(children: [Expanded(child: GridViewCard())]),
    );
  }
}

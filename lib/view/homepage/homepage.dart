import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/const/colors.dart';

import 'package:logo_e_learning/const/widgets/cart_bn.dart';
import 'package:logo_e_learning/controllers/user_details.dart';

import 'package:logo_e_learning/view/homepage/widgets/featured.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 1)).then((value) {
      Provider.of<UserDetails>(context, listen: false)
                  .userDetailslist
                  .isEmpty ||
              Provider.of<UserDetails>(context, listen: false).eroor == true
          ? Provider.of<UserDetails>(context, listen: false).getUserDetails()
          : "";

      Provider.of<WishListP>(context, listen: false).WishlistG.isEmpty ||
              Provider.of<WishListP>(context, listen: false).eroor == true
          ? Provider.of<WishListP>(context, listen: false).GetWishlist(context)
          : "";
      Provider.of<ProviderCoursess>(context, listen: false).allCourse.isEmpty ||
              Provider.of<ProviderCoursess>(context, listen: false).eroor ==
                  true
          ? Provider.of<ProviderCoursess>(context, listen: false)
              .GetAllCourses(context)
          : "";
      Provider.of<MyLearningsController>(context, listen: false)
                  .myCourses
                  .isEmpty ||
              Provider.of<MyLearningsController>(context, listen: false)
                      .error ==
                  true
          ? Provider.of<MyLearningsController>(context, listen: false)
              .MyLearningsModules()
          : "";
      Provider.of<CartProvider>(context, listen: false).cartList.isEmpty ||
              Provider.of<CartProvider>(context, listen: false).eroor == true
          ? Provider.of<CartProvider>(context, listen: false)
              .GetCartslist(context)
          : "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwite,
        automaticallyImplyLeading: false,
        actions: const [CartBtn()],
      ),
      body: Column(children: const [Expanded(child: Featured())]),
    );
  }
}

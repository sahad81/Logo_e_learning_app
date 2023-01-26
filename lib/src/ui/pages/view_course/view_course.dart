import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/cartPage/cart_page.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/provider_courses.dart';
import 'package:provider/provider.dart';

class ViewCourses extends StatefulWidget {
  const ViewCourses({super.key});

  @override
  State<ViewCourses> createState() => _ViewCoursesState();
}

class _ViewCoursesState extends State<ViewCourses> {
  @override


  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: kwite, actions: [
        IconButton(
            onPressed: () {
       
    Provider.of<ProviderCoursess>(context, listen: false).GetAllCourses(context);
    
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            icon: Icon(
              CupertinoIcons.cart,
              color: kblack,
            )),
      ]),
      body:
    Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: size1 * 0.02,
          ),
          InkWell(
            onTap: () {},
            onHover: (value) {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size1 * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Icon(
                  Icons.play_arrow_sharp,
                  size: 60,
                ),
              ),
            ),
          ),
          Ktext(
              text: "Flutter dart comptete Guide ",
              color: kblack,
              size: size1 * 0.027),
          SizedBox(
            height: size1 * 0.01,
          ),
          Ktext(
              text:
                  "A completed Guid to the Flutter Framework for Building Native ios and android app ",
              color: Colors.grey.shade600,
              size: size1 * 0.018),
          Row(
            children: [
              Ktext(
                text: "4.4",
                color: kblack,
                size: size1 * 0.018,
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: 7,
              ),
              Stars(),
            ],
          ),
          Ktext(text: "(50004958 ratings)", color: kblack, size: size1 * 0.013),
          SizedBox(
            height: size1 * 0.001,
          ),
          Ktext(
              text: "Created by sahad",
              color: Colors.grey.shade600,
              size: size1 * 0.012),
          Row(
            children: [
              Icon(
                Icons.language,
                size: size1 * 0.017,
              ),
              Ktext(text: "  english", color: kblack, size: size1 * 0.017),
            ],
          ),
          Row(
            children: [
              Ktext(
                  text: "₹490.00",
                  color: kblack,
                  size: size1 * 0.020,
                  weight: FontWeight.bold),
              Text(
                '  ₹6650.00',
                style: GoogleFonts.poppins(
                    fontSize: size1 * 0.020,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: size1 * 0.03,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              onPressed: () async {
                // ignore: use_build_context_synchronously
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900),
              child: Ktext(text: "Buy Now", color: kwite, size: size1 * 0.020),
            ),
          ),
          SizedBox(
            height: size1 * 0.035,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    maximumSize: const Size(150, 50),
                    backgroundColor: kwite),
                child: Ktext(
                  text: "Add to wishlist",
                  color: kblack,
                  size: size1 * 0.017,
                  weight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // ignore: use_build_context_synchronously
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    maximumSize: const Size(150, 100),
                    backgroundColor: Colors.white),
                child: Ktext(
                  text: "Add to cart",
                  color: kblack,
                  size: size1 * 0.017,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size1 * 0.01,
          ),
        ]),
      ));      
    
  }
}

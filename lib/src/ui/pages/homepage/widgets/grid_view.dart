// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/model/courses.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/provider_courses.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/src/ui/pages/view_course/view_course.dart';
import 'package:logo_e_learning/src/ui/pages/wish_list/controller_vishllist.dart';
import 'package:logo_e_learning/src/ui/pages/wish_list/wish_list_widget.dart';
import 'package:logo_e_learning/src/widgets/snackbar.dart';
import 'package:provider/provider.dart';

class GridViewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.blue.shade200],
        )),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Consumer<ProviderCoursess>(
              builder: (context, value, child) {
                return RefreshIndicator(
                  child: value.loading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: kblack,
                          ),
                        )
                      : value.eroor == true
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  value.Errormsg == "Connection failed"
                                      ? Column(
                                          children: [
                                            Ktext(
                                                text: "No Connction",
                                                color: kblack,
                                                size: 20),
                                            Ktext(
                                                text:
                                                    "Plesae check your internet connectivity \n and try agan",
                                                textalie: TextAlign.center,
                                                color: kblack,
                                                size: 13)
                                          ],
                                        )
                                      : Ktext(
                                          text: value.Errormsg,
                                          color: kblack,
                                          size: 20),
                                  SizedBox(
                                    height: size1 * 0.012,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        value.GetAllCourses(context);
                                      },
                                      child: const Text("Retry")),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: context
                                  .read<ProviderCoursess>()
                                  .courseNotifire
                                  .value
                                  .length,
                              itemBuilder: (context, index) {
                                final values =
                                    value.courseNotifire.value[index];
                                log(values.modules.toString());

                                return MAincard(
                                  id: values.id!,
                                  indru: values.modules!,
                                  discription: values.description.toString(),
                                  language: "english",
                                  teacher: values.teacher.toString(),
                                  img:
                                      "http://10.0.2.2:3000/${values.imgPath.toString()}",
                                  price: values.price.toString(),
                                  offerprice: "500",
                                  rating: "4.4",
                                  ratingcount: "200",
                                  course_titile: values.title.toString(),
                                );
                              },
                            ),
                  onRefresh: () {
                    return value.GetAllCourses(context);
                  },
                );
              },
            )));
  }
}

class MAincard extends StatelessWidget {
  const MAincard(
      {super.key,
      required this.img,
      required this.price,
      required this.offerprice,
      required this.rating,
      required this.ratingcount,
      required this.course_titile,
      required this.teacher,
      required this.discription,
      required this.language,
      required this.indru,
      required this.id});
  final String img;
  final String price;
  final String offerprice;
  final String rating;
  final String ratingcount;
  final String course_titile;
  final String teacher;
  final String discription;
  final String language;
  final List<Module> indru;
  final String id;
  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewCourses(
              indrudectionVedio: indru,
              titile: course_titile,
              imagepath: img,
              rating: rating,
              ratingCount: ratingcount,
              discription: discription,
              language: language,
              teacher: teacher,
              price: price,
              offerprice: offerprice),
        ));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
              color: Colors.grey.shade300,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: size1 * 0.17,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          img,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: size1 * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ktext(
                          text: course_titile,
                          color: kblack,
                          size: size1 * 0.016),
                      Row(
                        children: [
                          Text(rating),
                          SizedBox(
                            width: 6,
                          ),
                          Stars(),
                          Expanded(
                              child: Ktext(
                                  text: "($ratingcount)",
                                  color: Colors.grey,
                                  size: size1 * 0.014))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              '₹ $price',
                              style: TextStyle(
                                  fontSize: size1 * 0.0175,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ₹$offerprice',
                              style: TextStyle(
                                  fontSize: size1 * 0.0165,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                          ]),
                          // SizedBox(width: MediaQuery.of(context).size.width*0.035,),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    WishListP.AddToWishlist(id, context);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                    size: 27,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.shopping_cart,
                                      size: size1 * 0.030,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

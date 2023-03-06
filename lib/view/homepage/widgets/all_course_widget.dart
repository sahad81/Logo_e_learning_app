
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/controller_wishllist.dart';
import 'package:logo_e_learning/model/courses_model.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../../controllers/cart_controller.dart';

class AllCourseWidget extends StatelessWidget {
  const AllCourseWidget(
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
  final int rating;
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
              id: id,
            
              titile: course_titile,
              imagepath: img,
              rating: rating.toInt(),
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
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(18)),
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
                  padding: const EdgeInsets.only(left: 5),
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
                          Text(rating.toString()),
                           Stars(count: rating),
                          Ktext(
                              text: "($ratingcount)",
                              color: Colors.grey,
                              size: size1 * 0.014)
                        ],
                      ),
                      Ktext(text: teacher, color: Colors.grey, size: 15),
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
                          Consumer<WishListP>(builder: (context, value, _) {
                            return Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      //is a static funtion so //
                                      value.checkifinWishlistorNot(id) == false
                                          ? value.AddToWishlist(id, context)
                                          : value.RemoveFromWishlist(
                                              id, context);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: value.checkifinWishlistorNot(id) ==
                                              true
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 30,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: IconButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .addTocart(id, context);
                                      },
                                      icon: Icon(
                                        CupertinoIcons.shopping_cart,
                                        size: size1 * 0.030,
                                      )),
                                )
                              ],
                            );
                          })
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
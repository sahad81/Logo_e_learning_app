import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../../const/colors.dart';
import '../../../controllers/cart_controller.dart';
import '../../../controllers/controller_wishllist.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Consumer<ProviderCoursess>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 6),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.354,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: InkWell(
                    onTap: () {
                      final v = value.Recommended_For_You_List[index];
                      log(   v.ratedUsers.toString());
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewCourses(
                      
                            titile: v.title.toString(),
                            imagepath:
                                "http://$ipadressimg:3000/${value.Recommended_For_You_List[index].imgPath.toString()}",
                            rating: v.totalStar!.toInt(),
                          
                            ratingCount: v.ratedUsers.toString(),
                            discription: v.description.toString(),
                            language: "malayalam",
                            teacher: v.teacher.toString(),
                            price: v.price.toString(),
                            offerprice: "599",
                          
                            id: v.id.toString()),
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.66,
                      height: MediaQuery.of(context).size.height * 0.19,
                      decoration: BoxDecoration(
                          color: kwite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.16,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://$ipadressimg:3000/${value.Recommended_For_You_List[index].imgPath.toString()}"),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.Recommended_For_You_List[index].title
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: kblack,
                                    fontSize: size1 * 0.017,
                                  ),
                                ),
                                SizedBox(
                                  height: size1 * 0.002,
                                ),
                                Row(
                                  children: [
                                     Text(value.Recommended_For_You_List[index].totalStar.toString()),
                                    const SizedBox(width: 3),
                                     Stars(count: value.Recommended_For_You_List[index].totalStar!.toInt()),
                                    Ktext(
                                        text: "(${value.Recommended_For_You_List[index].ratedUsers})",
                                        color: Colors.grey,
                                        size: size1 * 0.014)
                                  ],
                                ),
                                SizedBox(
                                  height: size1 * 0.00090,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //main row
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.Recommended_For_You_List[index]
                                              .teacher
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16, color: kblueGray),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(children: [
                                          Text(
                                            '₹ ${value.Recommended_For_You_List[index].price}',
                                            style: TextStyle(
                                                fontSize: size1 * 0.0175,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            ' ₹ 900',
                                            style: TextStyle(
                                                fontSize: size1 * 0.0165,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Consumer<WishListP>(
                                        builder: (context, value1, _) {
                                      return Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                //is a static funtion so //
                                                value1.checkifinWishlistorNot(value
                                                            .Recommended_For_You_List[
                                                                index]
                                                            .id) ==
                                                        false
                                                    ? value1.AddToWishlist(
                                                        value
                                                            .Recommended_For_You_List[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        context)
                                                    : value1.RemoveFromWishlist(
                                                        value
                                                            .Recommended_For_You_List[
                                                                index]
                                                            .id
                                                            .toString(),
                                                        context);
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color: value1.checkifinWishlistorNot(
                                                            value
                                                                .Recommended_For_You_List[
                                                                    index]
                                                                .id) ==
                                                        true
                                                    ? Colors.red
                                                    : Colors.grey,
                                                size: 30,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: IconButton(
                                                onPressed: () {
                                                  Provider.of<CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .addTocart(
                                                          value
                                                              .Recommended_For_You_List[
                                                                  index]
                                                              .id
                                                              .toString(),
                                                          context);
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: context
                .read<ProviderCoursess>()
                .Recommended_For_You_List
                .length,
          ),
        ),
      );
    });
  }
}

// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/user_details.dart';
import 'package:logo_e_learning/view/homepage/categorie_view_page.dart';

import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';

import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../../../model/courses_model.dart';

class GridViewCard extends StatelessWidget {
  GridViewCard({super.key});

  List<dynamic> items = [
    "IT",
    "Design",
    "Finance",
    "Marketing",
    "Mubail Development",
    "bussiness",
    "Development",
  ];
  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomRight,
        //   colors: [Colors.white, Colors.blue.shade200],
        // )),
        child: Consumer<ProviderCoursess>(
      builder: (context, value, child) {
        return RefreshIndicator(
          child: value.loading == true ||
                  Provider.of<WishListP>(context).loading == true
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: kblack,
                  ),
                )
              : value.eroor == true ||
                      Provider.of<WishListP>(context).eroor == true
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
                                  text: "connection problem",
                                  color: kblack,
                                  size: 20),
                          SizedBox(
                            height: size1 * 0.012,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Provider.of<WishListP>(context, listen: false)
                                    .GetWishlist(context);
                                value.GetAllCourses(context);
                              },
                              child: const Text("Retry")),
                        ],
                      ),
                    )
                  : Container(
                      child: SingleChildScrollView(
                        child: Consumer(builder: (context, value1, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: size1 * 0.07,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.account_circle,
                                        size: size1 * 0.06,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Ktext(
                                            text: "Wellcome, sahad",
                                            color: kblack,
                                            size: 16),
                                        Ktext(
                                            text: "set a dream career.",
                                            color: kblue,
                                            size: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 220,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/lpa.jpg",
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ktext(
                                    text: "Recommended for you",
                                    color: kblack,
                                    size: 20,
                                    weight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.354,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            //set border radius more than 50% of height and width to make circle
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.66,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.19,
                                            decoration: BoxDecoration(
                                                color: kwite,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(13))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.16,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius
                                                                  .circular(
                                                                      13)),
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "http://$ipadressimg:3000/${value.allCourse[index].imgPath.toString()}"),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value.allCourse[index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: kblack,
                                                          fontSize:
                                                              size1 * 0.017,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: size1 * 0.002,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Text('4.4'),
                                                          const SizedBox(
                                                              width: 3),
                                                          const Stars(),
                                                          Ktext(
                                                              text: "(400)",
                                                              color:
                                                                  Colors.grey,
                                                              size:
                                                                  size1 * 0.014)
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: size1 * 0.00090,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //main row
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                value
                                                                    .allCourse[
                                                                        index]
                                                                    .teacher
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color:
                                                                        kblueGray),
                                                              ),
                                                              SizedBox(
                                                                height: 7,
                                                              ),
                                                              Row(children: [
                                                                Text(
                                                                  '₹ ${value.allCourse[index].price}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size1 *
                                                                              0.0175,
                                                                      color: Colors
                                                                          .green,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                  ' ₹ 900',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size1 *
                                                                              0.0165,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                          Consumer<WishListP>(
                                                              builder: (context,
                                                                  value1, _) {
                                               return Row(
                                                              children: [
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      //is a static funtion so //
                                                                      value1.checkifinWishlistorNot(value.allCourse[index].id) ==
                                                                              false
                                                                          ? value1.AddToWishlist(
                                                                              value.allCourse[index].id
                                                                                  .toString(),
                                                                              context)
                                                                          : value1.RemoveFromWishlist(
                                                                              value.allCourse[index].id.toString(),
                                                                              context);
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: value1.checkifinWishlistorNot(value.allCourse[index].id) ==
                                                                              true
                                                                          ? Colors
                                                                              .red
                                                                          : Colors
                                                                              .grey,
                                                                      size: 30,
                                                                    )),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right: 5),
                                                                  child: IconButton(
                                                                      onPressed: () {
                                                                        Provider.of<CartProvider>(context, listen: false).addtocart(
                                                                            value.allCourse[index].id.toString(),
                                                                            context);
                                                                      },
                                                                      icon: Icon(
                                                                        CupertinoIcons
                                                                            .shopping_cart,
                                                                        size: size1 *
                                                                            0.030,
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
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(),
                                    itemCount: context
                                        .read<ProviderCoursess>()
                                        .allCourse
                                        .length,
                                  ),
                                ),
                              ),
                              SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ktext(
                                    text: "Categories",
                                    color: kblack,
                                    size: 20,
                                    weight: FontWeight.bold),
                              ),

                              //--------------------------------------------------------------------categories----------------------------->
                              Container(
                                padding: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: double.infinity,
                                child: Wrap(
                                  spacing: 15,
                                  children: [
                                    ...List.generate(
                                        items.length,
                                        (index) => Container(
                                              child: ActionChip(
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                padding: EdgeInsets.all(8),
                                                label: Text(
                                                    //categoireslist[index]
                                                    items[index].toString()),
                                                onPressed: () {
Provider.of<ProviderCoursess>(context,listen: false).categoryselectedlist.clear();
                                                  Provider.of<ProviderCoursess>(
                                                              context,
                                                              listen: false)
                                                          .selectedcategory =
                                                      items[index];
                                                  Provider.of<ProviderCoursess>(
                                                          context,
                                                          listen: false)
                                                      .filter(context);
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoryPage(
                                                            category:
                                                                items[index]),
                                                  ));
                                                  log(items[index]);
                                                },
                                              ),
                                            ))
                                  ],
                                ),
                              ),

                              //--------------------------------------top mubail development courses---------------------->
                              Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Top courses in ',
                                      style: GoogleFonts.poppins(
                                          color: Colors.black, fontSize: 27),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Mobail Development',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kblue)),
                                      ],
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                          decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(1))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                13)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "http://$ipadressimg:3000/${value.MubailDevelopment[index].imgPath.toString()}"),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value
                                                          .MubailDevelopment[
                                                              index]
                                                          .title
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: kblack,
                                                        fontSize: size1 * 0.017,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('4.4'),
                                                        SizedBox(width: 3),
                                                        Stars(),
                                                        Expanded(
                                                            child: Ktext(
                                                                text: "(400)",
                                                                color:
                                                                    Colors.grey,
                                                                size: size1 *
                                                                    0.014))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size1 * 0.002,
                                                    ),
                                                    Ktext(
                                                        text: value
                                                            .MubailDevelopment[
                                                                index]
                                                            .teacher
                                                            .toString(),
                                                        color: Colors.grey,
                                                        size: size1 * 0.019),
                                                    SizedBox(
                                                      height: size1 * 0.0050,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                        '₹ ${value.allCourse[index].price}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size1 * 0.0175,
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        ' ₹ 900',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size1 * 0.0165,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color: Colors.grey),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 7),
                                    itemCount: context
                                        .read<ProviderCoursess>()
                                        .MubailDevelopment
                                        .length,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ktext(
                                    text: "All courses",
                                    color: kblack,
                                    size: 20,
                                    weight: FontWeight.bold),
                              ),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: context
                                    .read<ProviderCoursess>()
                                    .allCourse
                                    .length,
                                itemBuilder: (context, index) {
                                  final values = value.allCourse[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: MAincard(
                                      id: values.id!,
                                      indru: values.modules!,
                                      discription:
                                          values.description.toString(),
                                      language: "english",
                                      teacher: values.teacher.toString(),
                                      img:
                                          "http://$ipadressimg:3000/${values.imgPath.toString()}",
                                      price: values.price.toString(),
                                      offerprice: "500",
                                      rating: "4.4",
                                      ratingcount: "200",
                                      course_titile: values.title.toString(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
          onRefresh: () {
            return value.GetAllCourses(context);
          },
        );
      },
    ));
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
              id: id,
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
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18)),
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
                          const Stars(),
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
                                            .addtocart(id, context);
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

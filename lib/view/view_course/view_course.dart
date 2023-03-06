import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_wishllist.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

import 'package:logo_e_learning/view/cartPage/cart_page.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';

import 'package:provider/provider.dart';


// ignore: must_be_immutable
class ViewCourses extends StatelessWidget {
  const ViewCourses({
    super.key,
    required this.titile,
    required this.imagepath,
    required this.rating,
    required this.ratingCount,
    required this.discription,
    required this.language,
    required this.teacher,
    required this.price,
    required this.offerprice,
    required this.id,
  });

  final String titile;
  final String imagepath;
  final int rating;
  final String ratingCount;
  final String discription;
  final String language;
  final String teacher;
  final String price;
  final String offerprice;
  final String id;

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0, backgroundColor: kwite, actions: [
          IconButton(
              onPressed: () {
                Provider.of<ProviderCoursess>(context, listen: false)
                    .GetAllCourses(context);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
              },
              icon: Icon(
                CupertinoIcons.cart,
                color: kblack,
              )),
        ]),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 250,
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imagepath), fit: BoxFit.cover),
                )),
              ),
              Ktext(text: titile, color: kblack, size: size1 * 0.027),
              SizedBox(
                height: size1 * 0.01,
              ),
              Ktext(
                  text: discription,
                  color: Colors.grey.shade600,
                  size: size1 * 0.018),
              Row(
                children: [
                  Ktext(
                    text: rating.toString(),
                    color: kblack,
                    size: size1 * 0.018,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Stars(
                    count: rating.toInt(),
                  ),
                ],
              ),
              Ktext(
                  text: "($ratingCount ratings)",
                  color: kblack,
                  size: size1 * 0.013),
              SizedBox(
                height: size1 * 0.001,
              ),
              Ktext(
                  text: "Created by $teacher",
                  color: Colors.grey.shade600,
                  size: size1 * 0.012),
              Row(
                children: [
                  Icon(
                    Icons.language,
                    size: size1 * 0.017,
                  ),
                  Ktext(text: language, color: kblack, size: size1 * 0.017),
                ],
              ),
              Row(
                children: [
                  Ktext(
                      text: "₹$price",
                      color: kblack,
                      size: size1 * 0.020,
                      weight: FontWeight.bold),
                  Text(
                    '  ₹$offerprice',
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
                  child:
                      Ktext(text: "Buy Now", color: kwite, size: size1 * 0.020),
                ),
              ),
              SizedBox(
                height: size1 * 0.035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<WishListP>(builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (value.checkifinWishlistorNot(id) == true) {
                          value.RemoveFromWishlist(id, context);
                        } else {
                          value.AddToWishlist(id, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          maximumSize: const Size(150, 50),
                          backgroundColor: kwite),
                      child: Ktext(
                        text: value.checkifinWishlistorNot(id) == false
                            ? "Add to wishlist"
                            : "Wishlisted",
                        color: kblack,
                        size: size1 * 0.017,
                        weight: FontWeight.bold,
                      ),
                    );
                  }),
                  Consumer<CartProvider>(builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (value.checkinCart(id) == true) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ));
                        } else {
                          value.addTocart(id, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          maximumSize: const Size(150, 100),
                          backgroundColor: Colors.white),
                      child: value.cartList.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Ktext(
                              text: value.checkinCart(id) == true
                                  ? "Go to cart"
                                  : " Add to cart",
                              color: kblack,
                              size: size1 * 0.017,
                              weight: FontWeight.bold,
                            ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: size1 * 0.01,
              ),
            ]),
          ),
        ));
  }
}

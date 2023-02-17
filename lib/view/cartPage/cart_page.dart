// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:logo_e_learning/controllers/payment_controller.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/view/cartPage/widgets/cart_is_empty.dart';
import 'package:logo_e_learning/const/widgets/conncetion_error_widget.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
  
}

class _CartPageState extends State<CartPage> {
@override
  void initState() {
   Provider.of<PaymentProvider>(context,listen: false).makepayment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizef = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SingleChildScrollView(
        child: Provider.of<CartProvider>(context).eroor == true ||
                Provider.of<CartProvider>(context).loading == true
            ? const SizedBox()
            : Provider.of<CartProvider>(context).cartList[0].data!.isEmpty
                ? const SizedBox()
                : Card(
                    elevation: 20,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sizef * 0.07),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: sizef * 0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal  :',
                                          style: TextStyle(
                                            fontSize: sizeh * 0.02,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        Text(
                                          ' ₹${Provider.of<CartProvider>(context).totalcartAmount() + 1200}',
                                          style: TextStyle(
                                              fontSize: sizeh * 0.022,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeh * 0.01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: sizef * 0.00),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount :',
                                          style: TextStyle(
                                            fontSize: sizeh * 0.02,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        Text(
                                          ' ₹${1200}',
                                          style: TextStyle(
                                              fontSize: sizeh * 0.022,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: sizeh * 0.01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: sizef * 0.00),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total        ',
                                          style: TextStyle(
                                              fontSize: sizeh * 0.02,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          ' ₹${Provider.of<CartProvider>(context).totalcartAmount()}',
                                          style: TextStyle(
                                              fontSize: sizeh * 0.022,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: InkWell(
                                onTap: () {
                                  log("clicked");
                                  Provider.of<PaymentProvider>(context,
                                          listen: false)
                                      .openCheckout(Provider.of<CartProvider>(context,listen: false).totalcartAmount().toInt());
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade900),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Ktext(
                                        text: "Checkout",
                                        color: kwite,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.0229),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sizeh * 0.015,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
      ),
      appBar: AppBar(
        backgroundColor: kwite,
        elevation: 0,
        title: Ktext(text: "Checkout", color: kblack, size: sizeh * 0.024),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Provider.of<CartProvider>(context).eroor == true ||
                    Provider.of<CartProvider>(context).loading == true
                ? const SizedBox()
                : Ktext(
                    text:
                        "${Provider.of<CartProvider>(context).cartList[0].data!.length.toString()} Courses in Cart",
                    weight: FontWeight.bold,
                    color: kblack,
                    size: sizeh * 0.024),
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Consumer<CartProvider>(builder: (context, value, child) {
              return value.loading == true
                  ? const Center(child: CircularProgressIndicator())
                  : value.eroor == true
                      ? ConnnectionError(
                          size1: sizeh,
                        )
                      : value.cartList[0].data!.isEmpty
                          ? CartisEmpty(sizeh: sizeh, sizef: sizef)
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                final values = value
                                    .cartList[0].data![index].courseDetails![0];
                                log(value.totalcartAmount().toString());

                                return SizedBox(
                                  height: sizeh * 0.144,
                                  child: Card(
                                    child: ListTile(
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Ktext(
                                            text: values.teacher.toString(),
                                            color: Colors.grey,
                                            size: sizeh * 0.014,
                                          ),
                                          Row(
                                            children: [
                                              Ktext(
                                                  text: "3  ",
                                                  color: kblack,
                                                  size: sizeh * 0.014),
                                              const Stars(),
                                            ],
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      value.RemoveFromCart(
                                                          values.id.toString(),
                                                          context);
                                                    },
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                          color: kblueGray),
                                                    )),
                                                InkWell(
                                                    onTap: () {
                                                      Provider.of<WishListP>(
                                                              context,
                                                              listen: false)
                                                          .AddToWishlist(
                                                              values.id
                                                                  .toString(),
                                                              context);
                                                    },
                                                    child: Text(
                                                      "Move to Wishlist",
                                                      style: TextStyle(
                                                          color: kblueGray),
                                                    ))
                                              ]),
                                        ],
                                      ),
                                      trailing: Column(children: [
                                        Ktext(
                                            text: "₹${values.price}",
                                            color: kblueGray,
                                            size: sizeh * 0.019),
                                        const Text(
                                          "₹1300",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey),
                                        )
                                      ]),
                                      title: Text(
                                        values.title.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: Image(
                                            image: NetworkImage(
                                          "http://$ipadressimg:3000/${values.imgPath.toString()}",
                                        )),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(),
                              itemCount: value.cartList[0].data!.length);
            }),
          ))
        ]),
      ),
    );
  }
}

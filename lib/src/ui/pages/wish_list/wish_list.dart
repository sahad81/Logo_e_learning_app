import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwite,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Ktext(text: "Wishlist", color: kblack, size: 25),
        ),
        actions: const [
       CartBtn()
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: Container(
                      height: 80,
                      child: Card(
                        child: ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Ktext(
                                  text: "sahad", color: Colors.grey, size: 12),
                              Row(
                                children: [
                                  Ktext(text: "3  ", color: kblack, size: 12),

                                  const Stars(),
                                

                                ],
                              ),
                              Row(children: const [
                                Text(
                                  '₹490',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' ₹600',
                                  style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                              ]),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                          title: Ktext(
                              text:
                                  "the complete flutter Development Bootcamps with dart",
                              color: kblack,
                              size: 15),
                          leading: const Image(
                              image: NetworkImage(
                            "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg",
                          )),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: 10),
          ))
        ],
      ),
    );
  }
}

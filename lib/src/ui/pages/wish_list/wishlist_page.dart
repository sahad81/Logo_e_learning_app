import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/model/model_getWishlist.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/controlls/controller_vishllist.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
       Future.delayed(const Duration(microseconds: 3)).then((value) =>
            Provider.of<WishListP>(context, listen: false)
                .GetWishlist(context));
      
    final size1= MediaQuery.of(context).size.height;
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
      body:  Column(
        children: [
          Expanded(child: Consumer<WishListP>(builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                GetWishlistModel values = value.WishlistG[0];
                 Datum    data=values.data[index];
                 
                    return SizedBox(
                      height: size1 * 0.18,
                      child: Card(
                        child: ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Ktext(
                                  text: data.courseDetails![0].teacher.toString(),
                                  color: Colors.grey,
                                  size: size1 * 0.0145),
                              Row(
                                children: [
                                  Ktext(
                                      text: "3  ",
                                      color: kblack,
                                      size: size1 * 0.0145),
                                  const Stars(),
                                ],
                              ),
                              Row(children: [
                                Text(
                                  '₹${data.courseDetails![0].price}',
                                  style: TextStyle(
                                      fontSize: size1 * 0.0165,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' ₹600',
                                  style: TextStyle(
                                      fontSize: size1 * 0.0165,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                              ]),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                value.RemoveFromWishlist(data.courseDetails![0].id.toString(), context);
                                log("clicked");
                                value.GetWishlist(context);
                              }, icon: const Icon(Icons.delete)),
                          title: Ktext(
                              text:
                                  data.courseDetails![0].title.toString(),
                              color: kblack,
                              size: size1 * 0.0175),
                          leading:  Image(
                            width: MediaQuery.of(context).size.width*0.3,
                              height: MediaQuery.of(context).size.height*0.2,
                              image: NetworkImage(
                           "http://10.0.2.2:3000/${data.courseDetails![0].imgPath.toString()}",
                          )),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, indez) => const SizedBox(),
                  itemCount: value.datas.length,),
            );
          }))
        ],
      ), 
    );
  }
}
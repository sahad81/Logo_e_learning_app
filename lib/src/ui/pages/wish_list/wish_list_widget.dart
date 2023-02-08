
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';



class WishlistWidget extends StatelessWidget {
   const WishlistWidget({super.key, required this.teacher, required this.ratingCount, required this.rating_stars, required this.title, required this.image, required this.offerprice, required this.id, required this.price, required this.count});
final String teacher;
final String ratingCount;
final String rating_stars;
final String title;
final String image;
final String offerprice;
final String id;
final String price;
final int count;


  @override
  Widget build(BuildContext context) {
  
    final size1= MediaQuery.of(context).size.height;
    return  Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height:size1 * 0.18,
                    child: Card(
                      child: ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Ktext(
                                text: teacher, color: Colors.grey, size: size1 * 0.0145),
                            Row(
                              children: [
                                Ktext(text: rating_stars, color: kblack, size: size1 * 0.0145),

                                const Stars(),
                              

                              ],
                            ),
                            Row(children:  [
                              Text(
                                '₹$price',
                                style: TextStyle(
                                    fontSize: size1 * 0.0165,
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
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete)),
                        title: Ktext(
                            text:
                                title,
                            color: kblack,
                            size:size1 * 0.0175),
                        leading:  Image(
                            image: NetworkImage(
                          image,
                        )),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: count)
                )
                )
                ]);
       
  
  }
}

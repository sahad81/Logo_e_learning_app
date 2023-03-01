import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/const/widgets/conncetion_error_widget.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/const/widgets/cart_bn.dart';
import 'package:provider/provider.dart';
import '../../model/wishlist_model.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwite,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Ktext(text: "Wishlist", color: kblack, size: 25),
        ),
        actions: const [CartBtn()],
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Consumer<WishListP>(builder: (context, value, child) {
            return Expanded(
                child: value.loading
                    ? const Center(child: CircularProgressIndicator())
                    : value.eroor
                        ? const Center(child: ConnnectionError())
                        : RefreshIndicator(
                            onRefresh: () {
                              return value.GetWishlist(context);
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: value.WishlistG[0].data.isEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: sizeh * 0.18,
                                          ),
                                          SvgPicture.asset(
                                            "assets/undraw_wishlist_re_m7tv.svg",
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.16,
                                          ),
                                          SizedBox(
                                            height: sizeh * 0.027,
                                          ),
                                          const Ktext(
                                            text:
                                                "Want to save Something fot later?",
                                            color: Colors.grey,
                                            size: 17,
                                            textalie: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: sizeh * 0.027,
                                          ),
                                          const Ktext(
                                            text: "your wishlist will go here ",
                                            color: Colors.grey,
                                            size: 17,
                                            textalie: TextAlign.center,
                                          ),
                                        ],
                                      )
                                    : ListView.separated(
                                        itemBuilder: (context, index) {
                                          WishlistModel values =
                                              value.WishlistG[0];
                                          Datum data = values.data[index];

                                          return Card(
                                            child: ListTile(
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Ktext(
                                                      text: data
                                                          .courseDetails![0]
                                                          .teacher
                                                          .toString(),
                                                      color: Colors.grey,
                                                      size: sizeh * 0.0145),
                                                  Row(
                                                    children: [
                                                      Ktext(
                                                          text: "3  ",
                                                          color: kblack,
                                                          size: sizeh * 0.0145),
                                                      const Stars(),
                                                    ],
                                                  ),
                                                  Row(children: [
                                                    Text(
                                                      '₹${data.courseDetails![0].price}',
                                                      style: TextStyle(
                                                          fontSize:
                                                              sizeh * 0.0165,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      ' ₹600',
                                                      style: TextStyle(
                                                          fontSize:
                                                              sizeh * 0.0165,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.grey),
                                                    ),
                                                  ]),
                                                  SizedBox(
                                                    height: sizeh * 0.01,
                                                  )
                                                ],
                                              ),
                                              trailing: IconButton(
                                                  onPressed: () {
                                                    value.RemoveFromWishlist(
                                                        data.courseDetails![0]
                                                            .id
                                                            .toString(),
                                                        context);

                                                    //     value.GetWishlist(context);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete)),
                                              title: Ktext(
                                                  text: data
                                                      .courseDetails![0].title
                                                      .toString(),
                                                  color: kblack,
                                                  size: sizeh * 0.0175),
                                              leading: Image(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.20,
                                                  image: NetworkImage(
                                                    "http://$ipadressimg:3000/${data.courseDetails![0].imgPath.toString()}",
                                                  )),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, indez) =>
                                            const SizedBox(),
                                        itemCount:
                                            value.WishlistG[0].data.length,
                                      )),
                          ));
          }),
        ],
      ),
    );
  }
}

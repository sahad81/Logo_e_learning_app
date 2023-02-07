
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizef = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.16 ,
          color: kwite,
          child: Column(
            children: [
             
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Padding(
                padding:  EdgeInsets.only(left: 15,right: 15,top: sizeh*0.016),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(
                              fontSize: sizeh*0.02,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          ' ₹1600',
                          style: TextStyle(
                              fontSize: sizeh * 0.022,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 70),
                        Text(
                          '₹6650',
                          style: TextStyle(
                              fontSize: sizeh * 0.019,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text("81% off")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.0,),
            
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 14),
                child: Container(
                  width: MediaQuery.of(context).size.width ,
                  height:  MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(color: Colors.blue.shade900),
                  child: Align(
                    alignment: Alignment.center,
                    child: Ktext(text: "Checkout", color: kwite, size: MediaQuery.of(context).size.height*0.0229),
                  ),
                ),
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
          SizedBox(
            height: sizeh * 0.02,
          ),
          
      
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Ktext(
                text: "10 Courses in Cart", color: kblack, size: sizeh * 0.024),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Card(
                      child: ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ktext(
                              text: "sahad",
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Remove",
                                        style: TextStyle(color: kblueGray),
                                      )),
                                  InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Move to Wishlist",
                                        style: TextStyle(color: kblueGray),
                                      ))
                                ]),
                          ],
                        ),
                        trailing: Column(children: [
                          Ktext(
                              text: "₹300",
                              color: kblueGray,
                              size: sizeh * 0.019),
                          const Text(
                            "₹1300",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          )
                        ]),
                        title: Ktext(
                            text:
                                "the complete flutter Development Bootcamps with dart",
                            color: kblack,
                            size: sizeh * 0.017),
                        leading: SizedBox(
                          width: MediaQuery.of(context).size.width*0.18,
                          child: const Image(
                              image: NetworkImage(
                            "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg",
                          )),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: 2),
          ))
        ]),
      ),
    );
  }
}
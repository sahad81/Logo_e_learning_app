
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
   return Scaffold(
 bottomNavigationBar: Container(
  width:  MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height*0.08,
color: kwite,
child: Padding(
  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 14),
  child:   Container(
  
    width:  MediaQuery.of(context).size.width*0.8,
  
    decoration: BoxDecoration(color: kblueGray),
  
    child: Center(child: Ktext(text: "Checkout", color: kwite, size:20),),),
),
 ),
appBar:  AppBar(
  backgroundColor: kwite
  ,
  elevation: 0,
  title: Ktext(text: "Checkout", color:kblack, size: 20),
    automaticallyImplyLeading: true,
    
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
           Row(children:  [
            const SizedBox(width: 10,),
                            Text(
                              'Totel :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 6,),
                            const Text(
                              ' ₹1600',
                              style: TextStyle(
                                  fontSize: 30,
                                
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                  ),
                            ),
                            const SizedBox(width: 10,),
                             Text(
                              '₹6650',
                              style: TextStyle(
                                  fontSize: 19,
                               decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold
                                  ),
                            ),
                            const SizedBox(width: 12,),
                            const Text("81% off")
                          ]),
                          
                          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Ktext(text: "3 Courses in Cart", color: kblack, size: 20),
                            
                          ),
                          Divider(thickness: 2,),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                
                                  InkWell(
                                    onTap: (){},
                                    child: Text("Remove",style: TextStyle(color: kblueGray),)),
                                     InkWell(
                                    onTap: (){},
                                    child: Text("Move to Wishlist",style: TextStyle(color: kblueGray),))
                              ]),
                            ],
                          ),
                          trailing: Column(children: [
                            Ktext(text: "₹300", color: kblueGray, size: 17),
                            Text("₹1300",style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey),)
                          ]),
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
                itemCount: 3 ),
          ))
      ]),
    ),
    );
  
  }
}
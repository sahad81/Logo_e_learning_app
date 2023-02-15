
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

import 'package:logo_e_learning/const/widgets/cart_bn.dart';
import 'package:logo_e_learning/view/learnings/parchased_course/parcahsed_courses.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
     final size1=MediaQuery.of(context).size.height;

 return   Scaffold(appBar: AppBar(
  elevation: 0,
      backgroundColor: kwite,
      title: Ktext(text: "My cources", color: kblack, size: size1*0.0275),
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child:CartBtn(),
      )],
    ),
    body: ListView.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
   clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
  		borderRadius: BorderRadius.circular(10),),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => curriculem(),)),
        child: Container(
            height:  size1 * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
              color: Colors.grey.shade300,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: size1 * 0.20,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Ktext(text: "Flutter full cource", color: kblack, size:  size1*0.0245),
                 
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Ktext(text: "Learn To Build & Program Beautiful, Fast, And Native-Quality Apps With Our Flutter Course. Find the right instructor for you. Choose from many topics, skill levels, and languages. Lifetime access. Real-world experts. 213,000+ online courses. 30-day guarantee.",
                  color: kblack, size: size1*0.014),
               )
               ]) ),
      ),
      ));
    },
    itemCount: 3,
    
       ),
    );
  }
}
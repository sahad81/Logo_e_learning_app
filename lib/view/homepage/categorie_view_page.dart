import 'dart:math';

import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';

import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../const/strings.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final String category;
  @override
   Widget build(BuildContext context) {
    final valup=Provider.of<ProviderCoursess>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ktext(text: category, color: kblack, size: 24),
              Consumer<ProviderCoursess>(builder: (context, value, child) {
                
                return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      
                         
                     
                 //  valup.filter();

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewCourses(
                                titile: value.categoryselectedlist[index].title.toString(),
                                imagepath:
                                    "http://$ipadressimg:3000/${ value.categoryselectedlist[index].imgPath.toString()}",
                                rating: "5",
                                ratingCount: "599",
                                discription:  value.categoryselectedlist[index].description.toString(),
                                language: "english",
                                teacher:  value.categoryselectedlist[index].teacher.toString(),
                                price:  value.categoryselectedlist[index].price.toString(),
                                offerprice: "5000",
                                indrudectionVedio:  value.categoryselectedlist[index].modules!,
                                id:  value.categoryselectedlist[index].id.toString()),
                          ));
                        },
                        child: ListTile(
                          leading: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "http://$ipadressimg:3000/${ value.categoryselectedlist[index].imgPath.toString()}",
                                    ),
                                    fit: BoxFit.cover),
                              )),
                          title: Ktext(
                              text:  value.categoryselectedlist[index].title.toString(),
                              color: kblack,
                              size: 16,
                              weight: FontWeight.bold),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Ktext(
                                  text:  value.categoryselectedlist[index].teacher.toString(),
                                  color: Colors.grey,
                                  size: 16),
                              Row(
                                children: const [
                                  Text('4.4'),
                                  SizedBox(width: 3),
                                  Stars(),
                                  Ktext(
                                      text: "(400)",
                                      color: Colors.grey,
                                      size: 12),
                                ],
                              ),
                              Ktext(
                                text: "5000",
                                color: kblack,
                                size: 15,
                                weight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount:
                  
                    value.categoryselectedlist.length
                     );
              })
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';

import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../const/strings.dart';

class CategoryPage extends StatelessWidget {
  static String routName = "/categorypage";
  const CategoryPage({super.key, this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ktext(
                      text: category!,
                      color: kblack,
                      size: 26,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Ktext(
                        text: "Courses to get you started",
                        color: kblack,
                        size: 22),
                  ],
                ),
              ),
              Consumer<ProviderCoursess>(builder: (context, value, child) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      //  valup.filter();

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewCourses(
                                titile: value.categoryselectedlist[index].title
                                    .toString(),
                                imagepath:
                                    "http://$ipadressimg:3000/${value.categoryselectedlist[index].imgPath.toString()}",
                                rating:value.categoryselectedlist[index].totalStar!.toInt(),
                                ratingCount:value.categoryselectedlist[index].ratedUsers.toString(),
                                discription: value
                                    .categoryselectedlist[index].description
                                    .toString(),
                                language: "english",
                                teacher: value
                                    .categoryselectedlist[index].teacher
                                    .toString(),
                                price: value.categoryselectedlist[index].price
                                    .toString(),
                                offerprice: "5000",
                             
                                id: value.categoryselectedlist[index].id
                                    .toString()),
                          ));
                        },
                        child: InkWell(
                          onTap: () {
                            final v = value.categoryselectedlist[index];
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewCourses(
                                  titile: v.title.toString(),
                                  imagepath:
                                      "http://$ipadressimg:3000/${v.imgPath.toString()}",
                                  rating: v.totalStar!.toInt(),
                                  ratingCount: "569",
                                  discription: v.description.toString(),
                                  language: "malayalam",
                                  teacher: v.teacher.toString(),
                                  price: v.price.toString(),
                                  offerprice: "599",
                                  
                                  id: v.id.toString()),
                            ));
                          },
                          child: ListTile(
                            leading: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "http://$ipadressimg:3000/${value.categoryselectedlist[index].imgPath.toString()}",
                                      ),
                                      fit: BoxFit.cover),
                                )),
                            title: Ktext(
                                text: value.categoryselectedlist[index].title
                                    .toString(),
                                color: kblack,
                                size: 16,
                                weight: FontWeight.bold),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Ktext(
                                    text: value
                                        .categoryselectedlist[index].teacher
                                        .toString(),
                                    color: Colors.grey,
                                    size: 16),
                                Row(
                                  children: [
                                    Text(value
                                        .categoryselectedlist[index].totalStar
                                        .toString()),
                                    const SizedBox(width: 3),
                                    Stars(
                                        count: value.categoryselectedlist[index]
                                            .totalStar!
                                            .toInt()),
                                    Ktext(
                                        text:
                                            "(${value.categoryselectedlist[index].ratedUsers.toString()})",
                                        color: Colors.grey,
                                        size: 12),
                                  ],
                                ),
                                Ktext(
                                  text: value.categoryselectedlist[index].price
                                      .toString(),
                                  color: kblack,
                                  size: 15,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: value.categoryselectedlist.length);
              })
            ],
          ),
        ),
      )),
    );
  }
}

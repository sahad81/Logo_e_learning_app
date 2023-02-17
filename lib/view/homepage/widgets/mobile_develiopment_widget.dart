import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/view/homepage/widgets/rating_stars.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../../const/colors.dart';
import '../../../const/kwidgets.dart';
import '../../../const/strings.dart';

class MobileDevelopmentWidget extends StatelessWidget {
  const MobileDevelopmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return Consumer<ProviderCoursess>(builder: (context, value, child) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1),
              child: InkWell(
                onTap: () {
                  final v = value.MobileDevelopment[index];
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewCourses(
                        titile: v.title.toString(),
                        imagepath:
                            "http://$ipadressimg:3000/${value.MobileDevelopment[index].imgPath.toString()}",
                        rating: "4.5",
                        ratingCount: "569",
                        discription: v.description.toString(),
                        language: "malayalam",
                        teacher: v.teacher.toString(),
                        price: v.price.toString(),
                        offerprice: "599",
                        indrudectionVedio: v.modules!,
                        id: v.id.toString()),
                  ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.019,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://$ipadressimg:3000/${value.MobileDevelopment[index].imgPath.toString()}"),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.MobileDevelopment[index].title.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: kblack,
                                fontSize: size1 * 0.017,
                              ),
                            ),
                            Row(
                              children: [
                                Text('4.4'),
                                SizedBox(width: 3),
                                Stars(),
                                Expanded(
                                    child: Ktext(
                                        text: "(400)",
                                        color: Colors.grey,
                                        size: size1 * 0.014))
                              ],
                            ),
                            SizedBox(
                              height: size1 * 0.002,
                            ),
                            Ktext(
                                text: value.MobileDevelopment[index].teacher
                                    .toString(),
                                color: Colors.grey,
                                size: size1 * 0.019),
                            SizedBox(
                              height: size1 * 0.0050,
                            ),
                            Row(children: [
                              Text(
                                '₹ ${value.allCourse[index].price}',
                                style: TextStyle(
                                    fontSize: size1 * 0.0175,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                ' ₹ 900',
                                style: TextStyle(
                                    fontSize: size1 * 0.0165,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 7),
          itemCount: context.read<ProviderCoursess>().MobileDevelopment.length,
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/const/widgets/conncetion_error_widget.dart';
import 'package:logo_e_learning/controllers/search_controller.dart';
import 'package:logo_e_learning/view/view_course/view_course.dart';
import 'package:provider/provider.dart';

import '../../../const/strings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<SearchController>(
      context,
    ).loading
        ? const Center(child: CircularProgressIndicator())
        : Provider.of<SearchController>(context, listen: false).error
            ? const ConnnectionError()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kheight15,
                  Expanded(child: Consumer<SearchController>(
                      builder: (context, value, child) {
                    return value.datas[0].data.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Ktext(
                                    text: "No matching courses",
                                    color: Colors.black,
                                    size: 20),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Center(
                                child: Ktext(
                                    text: "Try a different search",
                                    color: Colors.grey,
                                    size: 15),
                              )
                            ],
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final v = value.datas[0].data[index];

                              return Padding(
                                padding: const EdgeInsets.all(6),
                                child: Items(
                                    dis: v.description.toString(),
                                    teacher: v.teacher.toString(),
                                    id: v.id.toString(),
                                    price: v.price!.toInt(),
                                    ratings: v.ratedUsers!.toInt(),
                                    star: v.rating!.toInt(),
                                    img:
                                        "http://$ipadressimg:3000/${v.imgPath.toString()}",
                                    title: v.title!),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount: value.datas[0].data.length);
                  }))
                ],
              );
  }
}

// ignore: must_be_immutable
class Items extends StatelessWidget {
  String title;
  String img;
  String id;
  String dis;
  int price;
  int ratings;
  int star;
  String teacher;

  Items(
      {super.key,
      required this.title,
      required this.img,
      required this.id,
      required this.dis,
      required this.price,
      required this.star,
      required this.ratings,
      required this.teacher});

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewCourses(
              titile: title,
              imagepath: img,
              rating: star,
              ratingCount: ratings.toString(),
              discription: dis,
              language: "English",
              teacher: teacher,
              price: price.toString(),
              offerprice: "900",
              id: id),
        ));
      },
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: sizer * 0.35,
            height: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(img))),
          ),
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
        )),
      ]),
    );
  }
}

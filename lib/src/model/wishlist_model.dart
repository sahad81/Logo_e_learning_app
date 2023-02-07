// To parse this JSON data, do

import 'dart:convert';

WishlistModel getWishlistFromJson(String str) =>
    WishlistModel.fromJson(json.decode(str));

mapToString(Map<String, dynamic> map) {
  jsonEncode(map);
  WishlistModel WislistAndCartFromJson(String str) =>
      WishlistModel.fromJson(json.decode(str));
}

class WishlistModel {
  WishlistModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.user,
    this.courses,
    this.v,
    this.courseDetails,
  });

  String? id;
  String? user;
  String? courses;
  int? v;
  List<CourseDetail>? courseDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: json["user"],
        courses: json["courses"],
        v: json["__v"],
        courseDetails: List<CourseDetail>.from(
            json["course_details"].map((x) => CourseDetail.fromJson(x))),
      );
}

class CourseDetail {
  CourseDetail({
    this.id,
    this.title,
    this.description,
    this.imgName,
    this.price,
    this.teacher,
    this.modules,
    this.imgPath,
  });

  String? id;
  String? title;
  String? description;
  String? imgName;
  dynamic? price;
  String? teacher;
  List<Module>? modules;
  String? imgPath;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        imgName: json["imgName"],
        price: json["price"],
        teacher: json["teacher"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        imgPath: json["imgPath"],
      );
}

class Module {
  Module({
    required this.vidioTitle,
    required this.vedioPath,
  });

  String? vidioTitle;
  String? vedioPath;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        vidioTitle: json["vidioTitle"],
        vedioPath: json["vedioPath"],
      );
}

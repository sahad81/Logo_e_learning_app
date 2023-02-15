// To parse this JSON data, do
//
//     final getCarts = getCartsFromJson(jsonString);

import 'dart:convert';

CartModel getCartsFromJson(String str) => CartModel.fromJson(json.decode(str));

class CartModel {
  CartModel({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.courses,
    this.v,
    this.courseDetails,
  });

  String? id;
  String? userId;
  Courses? courses;
  int? v;
  List<CourseDetail>? courseDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        courses: Courses.fromJson(json["courses"]),
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
    required this.price,
    this.teacher,
    this.imgPath,
  });

  String? id;
  String? title;
  String? description;
  String? imgName;
  dynamic price;
  String? teacher;

  String? imgPath;

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        imgName: json["imgName"],
        price: json["price"],
        teacher: json["teacher"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "imgName": imgName,
        "price": price,
        "teacher": teacher,
        "imgPath": imgPath,
      };
}

class Courses {
  Courses({
    required this.courseId,
    required this.id,
  });

  String courseId;
  String id;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseId: json["courseId"],
        id: json["_id"],
      );
}

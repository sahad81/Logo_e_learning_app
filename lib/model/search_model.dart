// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

class SearchModel {
  SearchModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.rating,
    this.id,
    this.category,
    this.title,
    this.description,
    this.imgName,
    this.price,
    this.totalStar,
    this.teacher,
    this.ratedUsers,
    this.modules,
    this.imgPath,
  });

  int? rating;
  String? id;
  String? category;
  String? title;
  String? description;
  String? imgName;
  int? price;
  int? totalStar;
  String? teacher;
  int? ratedUsers;
  List<Module>? modules;
  String? imgPath;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rating: json["rating"],
        id: json["_id"],
        category: json["category"],
        title: json["title"],
        description: json["description"],
        imgName: json["imgName"],
        price: json["price"],
        totalStar: json["totalStar"],
        teacher: json["teacher"],
        ratedUsers: json["ratedUsers"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        imgPath: json["imgPath"],
      );
}

class Module {
  Module({
    this.videoTitle,
    this.id,
    this.vidioTitle,
    this.vedioPath,
    this.notePath,
  });

  String? videoTitle;
  String? id;
  String? vidioTitle;
  String? vedioPath;
  String? notePath;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        videoTitle: json["videoTitle"],
        id: json["_id"],
        vidioTitle: json["vidioTitle"],
        vedioPath: json["vedioPath"],
        notePath: json["notePath"],
      );
}

// To parse this JSON data, do
//
//     final couressModel = couressModelFromJson(jsonString);

import 'dart:convert';

List<CouressModel> couressModelFromJson(String str) => List<CouressModel>.from(
    json.decode(str).map((x) => CouressModel.fromJson(x)));



class CouressModel {
  CouressModel({
     this.id,
     this.title,
     this.description,
     this.imgName,
     this.price,
     this.teacher,
     this.modules,
     this.imgPath,
      this.category
  });

  String? id;
  String? title;
  String? description;
  String? imgName;
  int? price;
  String? teacher;
  List<Module>? modules;
  String? imgPath;
  String? category;
  factory CouressModel.fromJson(Map<String, dynamic> json) => CouressModel(
        id: json["_id"],
        category: json["category"],
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
    this.videoTitle,
    this.id,
    this.vidioTitle,
    this.notePsth,
    this.vedioPath,
    this.questionPath,
  });

  String? videoTitle;
  String? id;
  String? vidioTitle;
  String? notePsth;
  String? vedioPath;
  String? questionPath;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        videoTitle: json["videoTitle"],
        id: json["_id"],
        vidioTitle: json["vidioTitle"],
        notePsth: json["notePsth"],
        vedioPath: json["vedioPath"],
        questionPath: json["questionPath"],
      );
}

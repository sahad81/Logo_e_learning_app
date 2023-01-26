// import 'dart:convert';

// List<CouressModel> couressModelFromJson(String str) => List<CouressModel>.from(
//     json.decode(str).map((x) => CouressModel.fromJson(x)));

// // String couressModelToJson(List<CouressModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CouressModel {
//   CouressModel({
//    this.id,
//    this.title,
//     this.description,
//     this.imgName,
//    this.price,
//    this.teacher,
//     this.modules,
//     this.imgPath,
//   });
//  String? id;
//  String? title;
//   String? description;
//   String? imgName;
//  int? price;
//  String? teacher;
//   List<dynamic>? modules;
//   String? imgPath;
// factory CouressModel.fromJson(dynamic json) {
//     if (json == null) {
//       return CouressModel();
//     } else {
//       return CouressModel(
//        id: json["id"].toString(),
//        title: json["title"],
//         description: json["description"],
//         imgName: json["imgName"],
//        price: json["price"],
//        teacher: json["teacher"],
//         modules: List<dynamic>.from(json["modules"].map((x) => x)),
//         imgPath: json["imgPath"],
//       );
//     }
//   }
// }

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
  });

  String? id;
  String? title;
  String? description;
  String? imgName;
  int? price;
  String? teacher;
  List<dynamic>? modules;
  String? imgPath;

  factory CouressModel.fromJson(dynamic json) => CouressModel(
        id: json["_id"] ,
        title: json["title"],
        description: json["description"],
        imgName: json["imgName"],
        price: json["price"],
        teacher: json["teacher"],
        modules: List<dynamic>.from(json["modules"].map((x) => x)),
        imgPath: json["imgPath"],
      );
}

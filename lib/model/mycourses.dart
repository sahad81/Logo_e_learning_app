// To parse this JSON data, do
//
//     final myCourses = myCoursesFromJson(jsonString);
import 'dart:convert';
MyCoursesModel myCoursesFromJson(String str) => MyCoursesModel.fromJson(json.decode(str));

class MyCoursesModel {
  MyCoursesModel({
    this.status,
    this.courses,
  });

  bool? status;
  List<Course>? courses;

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) => MyCoursesModel(
        status: json["status"],
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );
}
class Course {
  Course({
    this.id,
    this.userId,
    this.courses,
    this.courseDetails,
  });

  String? id;
  String? userId;
  Courses? courses;
  List<CourseDetail>? courseDetails;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        userId: json["userId"],
        courses: Courses.fromJson(json["courses"]),
        courseDetails: List<CourseDetail>.from(
            json["course_details"].map((x) => CourseDetail.fromJson(x))),
      );
}

class CourseDetail {
  CourseDetail({
    this.id,
    this.category,
    this.title,
    this.description,
    this.imgName,
    this.price,
    this.teacher,
    this.modules,
    this.imgPath,
  });

  String? id;
  String? category;
  String? title;
  String? description;
  String? imgName;
  int? price;
  String? teacher;
  List<Module>? modules;
  String? imgPath;


  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
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
    this.vidioTitle,
    this.vedioPath,
    this.notesPath
  });

  String? vidioTitle;
  String? vedioPath;
  String? notesPath;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        vidioTitle: json["vidioTitle"],
        vedioPath: json["vedioPath"],
        notesPath: json["notePath"]
      );
}

class Courses {
  Courses({
    this.courseId,
  });

  String? courseId;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        courseId: json["courseId"],
      );
}

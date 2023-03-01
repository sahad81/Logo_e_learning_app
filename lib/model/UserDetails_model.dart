
class UserDetailsModel {
  UserDetailsModel({
    this.userDetails,
    this.entrolledCourse,
  });

  UserDetailsM? userDetails;
  List<dynamic>? entrolledCourse;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        userDetails: UserDetailsM.fromJson(json["userDetails"]),
      );
}

class UserDetailsM {
  UserDetailsM({
    this.profileImg,
    this.id,
    this.name,
    this.email,
  });

  String? profileImg;

  String? id;
  String? name;
  String? email;

  factory UserDetailsM.fromJson(Map<String, dynamic> json) => UserDetailsM(
        profileImg: json["profile_img"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );
}

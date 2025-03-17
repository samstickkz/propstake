class UpdateUserModel {
  UpdateUserModel({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final UserData? data;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json){
    return UpdateUserModel(
      successful: json["successful"],
      message: json["message"],
      data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    );
  }

}

class UserData {
  UserData({
    required this.firstName,
    required this.lastName,
    required this.organisationName,
    required this.dob,
    required this.imageUrl,
    required this.img,
  });

  final String? firstName;
  final String? lastName;
  final dynamic organisationName;
  final String? dob;
  final dynamic imageUrl;
  final dynamic img;

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      firstName: json["firstName"],
      lastName: json["lastName"],
      organisationName: json["organisationName"],
      dob: json["dob"],
      imageUrl: json["imageUrl"],
      img: json["img"],
    );
  }

}

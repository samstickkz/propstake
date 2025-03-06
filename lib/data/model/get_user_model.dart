class GetUserModel {
  GetUserModel({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final User? data;

  factory GetUserModel.fromJson(Map<String, dynamic> json){
    return GetUserModel(
      successful: json["successful"],
      message: json["message"],
      data: json["data"] == null ? null : User.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": data?.toJson(),
  };

}

class User {
  User({
    this.fname,
    this.lname,
    this.dob,
    this.org,
    this.email,
    this.imageUrl,
    this.img,
  });

  final String? fname;
  final String? lname;
  final DateTime? dob;
  final dynamic org;
  final String? email;
  final String? imageUrl;
  final dynamic img;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      fname: json["fname"],
      lname: json["lname"],
      dob: DateTime.tryParse(json["dob"] ?? ""),
      org: json["org"],
      email: json["email"],
      imageUrl: json["imageUrl"],
      img: json["img"],
    );
  }

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "dob": dob?.toIso8601String(),
    "org": org,
    "email": email,
    "imageUrl": imageUrl,
    "img": img,
  };

}

class LoginAuthModel {
  LoginAuthModel({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final String? data;

  factory LoginAuthModel.fromJson(Map<String, dynamic> json){
    return LoginAuthModel(
      successful: json["successful"],
      message: json["message"],
      data: json["data"],
    );
  }

}

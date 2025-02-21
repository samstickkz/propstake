import 'dart:convert';

ResModel resModelFromJson(String str) => ResModel.fromJson(json.decode(str));
String resModelToJson(ResModel data) => json.encode(data.toJson());

String resModelDataToString(dynamic data) => json.encode(data);
dynamic resModelDataToJson(String data) => json.decode(data);

class ResModel {
  String? message;
  String? status;
  String? token;
  dynamic data;

  ResModel({this.message, this.token, this.status, this.data});

  ResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['token'] = token;
    data['data'] = data;
    return data;
  }
}

import 'dart:convert';

List<PropertyResponse> getPropertyResponseDataListFromJson(String str) =>
    List<PropertyResponse>.from(
        json.decode(str).map((x) => PropertyResponse.fromJson(x)));

String getPropertyResponseDataListToJson(List<PropertyResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyResponse {
  PropertyResponse({
    required this.id,
    required this.forRent,
    required this.bedAmount,
    required this.country,
    required this.returnPercentagePerYear,
    required this.images,
    required this.amountFunded,
    required this.name,
    required this.sale,
    required this.returnPercentageFiveYears,
    required this.location,
    required this.totalCost,
    required this.totalInvestors,
  });

  final String? id;
  final bool? forRent;
  final String? country;
  final num? returnPercentagePerYear;
  final List<String> images;
  final num? amountFunded;
  final List<Sale>? sale;
  final num? bedAmount;
  final String? name;
  final num? returnPercentageFiveYears;
  final String? location;
  final num? totalCost;
  final num? totalInvestors;

  PropertyResponse copyWith({
    String? id,
    bool? forRent,
    String? country,
    num? returnPercentagePerYear,
    List<String>? images,
    List<Sale>? sale,
    num? amountFunded,
    num? bedAmount,
    String? name,
    num? returnPercentageFiveYears,
    String? location,
    num? totalCost,
    num? totalInvestors,
  }) {
    return PropertyResponse(
      id: id ?? this.id,
      forRent: forRent ?? this.forRent,
      country: country ?? this.country,
      sale: sale ?? this.sale,
      bedAmount: bedAmount ?? this.bedAmount,
      returnPercentagePerYear: returnPercentagePerYear ?? this.returnPercentagePerYear,
      images: images ?? this.images,
      amountFunded: amountFunded ?? this.amountFunded,
      name: name ?? this.name,
      returnPercentageFiveYears: returnPercentageFiveYears ?? this.returnPercentageFiveYears,
      location: location ?? this.location,
      totalCost: totalCost ?? this.totalCost,
      totalInvestors: totalInvestors ?? this.totalInvestors,
    );
  }

  factory PropertyResponse.fromJson(Map<String, dynamic> json){
    return PropertyResponse(
      id: json["id"],
      forRent: json["forRent"],
      country: json["country"],
      bedAmount: json["bedAmount"],
      returnPercentagePerYear: json["returnPercentagePerYear"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      amountFunded: json["amountFunded"],
      name: json["name"],
      returnPercentageFiveYears: json["returnPercentageFiveYears"],
      location: json["location"],
      totalCost: json["totalCost"],
      totalInvestors: json["totalInvestors"],
      sale: json["sale"] == null ? [] : List<Sale>.from(json["sale"]!.map((x) => Sale.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "forRent": forRent,
    "country": country,
    "bedAmount": bedAmount,
    "returnPercentagePerYear": returnPercentagePerYear,
    "images": images.map((x) => x).toList(),
    "sale": sale?.map((x) => x.toJson()).toList(),
    "amountFunded": amountFunded,
    "name": name,
    "returnPercentageFiveYears": returnPercentageFiveYears,
    "location": location,
    "totalCost": totalCost,
    "totalInvestors": totalInvestors,
  };

  @override
  String toString(){
    return "$id, $forRent, $totalInvestors, $country, $bedAmount, $returnPercentagePerYear, $images, $amountFunded, $name, $returnPercentageFiveYears, $location, $totalCost, ";
  }
}


class Sale {
  Sale({
    required this.tempId,
    required this.userId,
    required this.amountSelected,
    required this.paymentType,
    required this.status,
    required this.wallet,
    required this.addedAt,
  });

  final String? tempId;
  final String? userId;
  final num? amountSelected;
  final String? paymentType;
  final String? status;
  final String? wallet;
  final String? addedAt;

  Sale copyWith({
    String? tempId,
    String? userId,
    num? amountSelected,
    String? paymentType,
    String? status,
    String? wallet,
    String? addedAt,
  }) {
    return Sale(
      tempId: tempId ?? this.tempId,
      userId: userId ?? this.userId,
      amountSelected: amountSelected ?? this.amountSelected,
      paymentType: paymentType ?? this.paymentType,
      status: status ?? this.status,
      wallet: wallet ?? this.wallet,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  factory Sale.fromJson(Map<String, dynamic> json){
    return Sale(
      tempId: json["tempID"],
      userId: json["userId"],
      amountSelected: json["amountSelected"],
      paymentType: json["paymentType"],
      status: json["status"],
      wallet: json["wallet"],
      addedAt: json["addedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
    "tempID": tempId,
    "userId": userId,
    "amountSelected": amountSelected,
    "paymentType": paymentType,
    "status": status,
    "wallet": wallet,
    "addedAt": addedAt,
  };

  @override
  String toString(){
    return "$tempId, $userId, $amountSelected, $paymentType, $status, $wallet, $addedAt, ";
  }
}

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
    required this.returnPercentageFiveYears,
    required this.location,
    required this.totalCost,
  });

  final String? id;
  final bool? forRent;
  final String? country;
  final num? returnPercentagePerYear;
  final List<String> images;
  final num? amountFunded;
  final num? bedAmount;
  final String? name;
  final num? returnPercentageFiveYears;
  final String? location;
  final num? totalCost;

  PropertyResponse copyWith({
    String? id,
    bool? forRent,
    String? country,
    num? returnPercentagePerYear,
    List<String>? images,
    num? amountFunded,
    num? bedAmount,
    String? name,
    num? returnPercentageFiveYears,
    String? location,
    num? totalCost,
  }) {
    return PropertyResponse(
      id: id ?? this.id,
      forRent: forRent ?? this.forRent,
      country: country ?? this.country,
      bedAmount: bedAmount ?? this.bedAmount,
      returnPercentagePerYear: returnPercentagePerYear ?? this.returnPercentagePerYear,
      images: images ?? this.images,
      amountFunded: amountFunded ?? this.amountFunded,
      name: name ?? this.name,
      returnPercentageFiveYears: returnPercentageFiveYears ?? this.returnPercentageFiveYears,
      location: location ?? this.location,
      totalCost: totalCost ?? this.totalCost,
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
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "forRent": forRent,
    "country": country,
    "bedAmount": bedAmount,
    "returnPercentagePerYear": returnPercentagePerYear,
    "images": images.map((x) => x).toList(),
    "amountFunded": amountFunded,
    "name": name,
    "returnPercentageFiveYears": returnPercentageFiveYears,
    "location": location,
    "totalCost": totalCost,
  };

  @override
  String toString(){
    return "$id, $forRent, $country, $bedAmount, $returnPercentagePerYear, $images, $amountFunded, $name, $returnPercentageFiveYears, $location, $totalCost, ";
  }
}

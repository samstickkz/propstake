import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propstake/data/model/propert_response.dart';

List<TempCart> getCartResponseDataListFromJson(String str) =>
    List<TempCart>.from(
        json.decode(str).map((x) => TempCart.fromJson(x)));

String getCartResponseDataListToJson(List<TempCart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TempCart {
  TempCart({
    required this.product,
    required this.amountSelected,
    required this.amounts,
    required this.tempId,
    required this.id,
    required this.userId,
    required this.addedAt,
  });

  final PropertyResponse? product;
  String? amountSelected;
  final List<String> amounts;
  final String? tempId;
  final String? id;
  final String? userId;
  final DateTime? addedAt;

  TempCart copyWith({
    PropertyResponse? product,
    String? amountSelected,
    List<String>? amounts,
    String? tempId,
    String? id,
    String? userId,
    DateTime? addedAt,
  }) {
    return TempCart(
      product: product ?? this.product,
      amountSelected: amountSelected ?? this.amountSelected,
      amounts: amounts ?? this.amounts,
      tempId: tempId ?? this.tempId,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  factory TempCart.fromJson(Map<String, dynamic> json){
    return TempCart(
      product: json["product"] == null ? null : PropertyResponse.fromJson(json["product"]),
      amountSelected: json["amountSelected"],
      amounts: json["amounts"] == null ? [] : List<String>.from(json["amounts"]!.map((x) => x)),
      tempId: json["tempID"],
      id: json["id"],
      userId: json["userId"],
      addedAt: DateTime.tryParse(json["addedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "amountSelected": amountSelected,
    "amounts": amounts.map((x) => x).toList(),
    "tempID": tempId,
    "id": id,
    "userId": userId,
    "addedAt": addedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$product, $amountSelected, $amounts, $tempId, $id, $userId, $addedAt, ";
  }

  updateAmount(String am){
    amountSelected = am;
  }
}



class TempTransactions {
  final String? id;
  final String? userId;
  final String? status;
  final double? amountSelected;
  final String? paymentType;
  final String? wallet;
  final String? tempID;
  final DateTime? addedAt;
  final DocumentReference? product;

  TempTransactions({
    this.id,
    this.userId,
    this.status,
    this.amountSelected,
    this.paymentType,
    this.wallet,
    this.tempID,
    this.addedAt,
    this.product,
  });

  factory TempTransactions.fromJson(Map<String, dynamic> json) {
    return TempTransactions(
      id: json['id'],
      userId: json['userId'],
      status: json['status'],
      amountSelected: (json['amountSelected'] as num?)?.toDouble(),
      paymentType: json['paymentType'],
      wallet: json['wallet'],
      tempID: json['tempID'],
      // addedAt: (json['addedAt'] as Timestamp?)?.toDate() ?? DateTime.tryParse(json['addedAt'].toString()),
      product: json['product'] as DocumentReference?,
    );
  }
}



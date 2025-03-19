class TransactionResponse {
  TransactionResponse({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final List<Transaction> data;

  TransactionResponse copyWith({
    bool? successful,
    String? message,
    List<Transaction>? data,
  }) {
    return TransactionResponse(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory TransactionResponse.fromJson(Map<String, dynamic> json){
    return TransactionResponse(
      successful: json["successful"],
      message: json["message"],
      data: json["data"] == null ? [] : List<Transaction>.from(json["data"]!.map((x) => Transaction.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": data.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$successful, $message, $data, ";
  }
}

class Transaction {
  Transaction({
    required this.description,
    required this.createdAt,
    required this.rewardAmount,
  });

  final String? description;
  final String? createdAt;
  final num? rewardAmount;

  Transaction copyWith({
    String? description,
    String? createdAt,
    num? rewardAmount,
  }) {
    return Transaction(
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rewardAmount: rewardAmount ?? this.rewardAmount,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json){
    return Transaction(
      description: json["Description"],
      createdAt: json["CreatedAt"],
      rewardAmount: json["RewardAmount"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Description": description,
    "CreatedAt": createdAt,
    "RewardAmount": rewardAmount,
  };

  @override
  String toString(){
    return "$description, $createdAt, $rewardAmount, ";
  }
}

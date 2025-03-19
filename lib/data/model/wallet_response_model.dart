class BalanceResponse {
  BalanceResponse({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final num? data;

  BalanceResponse copyWith({
    bool? successful,
    String? message,
    num? data,
  }) {
    return BalanceResponse(
      successful: successful ?? this.successful,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory BalanceResponse.fromJson(Map<String, dynamic> json){
    return BalanceResponse(
      successful: json["successful"],
      message: json["message"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() => {
    "successful": successful,
    "message": message,
    "data": data,
  };

  @override
  String toString(){
    return "$successful, $message, $data, ";
  }
}

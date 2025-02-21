class AuthResponse {
  AuthResponse({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  final num? statusCode;
  final String? status;
  final String? message;
  final AuthData? data;

  AuthResponse copyWith({
    num? statusCode,
    String? status,
    String? message,
    AuthData? data,
  }) {
    return AuthResponse(
      statusCode: statusCode ?? this.statusCode,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory AuthResponse.fromJson(Map<String, dynamic> json){
    return AuthResponse(
      statusCode: json["statusCode"],
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : AuthData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$statusCode, $status, $message, $data, ";
  }
}

class AuthData {
  AuthData({
    required this.user,
    required this.accessToken,
  });

  final User? user;
  final String? accessToken;

  AuthData copyWith({
    User? user,
    String? accessToken,
  }) {
    return AuthData(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  factory AuthData.fromJson(Map<String, dynamic> json){
    return AuthData(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      accessToken: json["access_token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "access_token": accessToken,
  };

  @override
  String toString(){
    return "$user, $accessToken, ";
  }
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profilePictureUrl,
    this.userPin,
    this.referralCode,
    this.referralRewardsLeft,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profilePictureUrl;
  final dynamic userPin;
  final String? referralCode;
  final num? referralRewardsLeft;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? profilePictureUrl,
    dynamic userPin,
    String? referralCode,
    num? referralRewardsLeft,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      userPin: userPin ?? this.userPin,
      referralCode: referralCode ?? this.referralCode,
      referralRewardsLeft: referralRewardsLeft ?? this.referralRewardsLeft,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      profilePictureUrl: json["profilePictureUrl"],
      userPin: json["userPin"],
      referralCode: json["referralCode"],
      referralRewardsLeft: json["referralRewardsLeft"],
      isVerified: json["isVerified"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "profilePictureUrl": profilePictureUrl,
    "userPin": userPin,
    "referralCode": referralCode,
    "referralRewardsLeft": referralRewardsLeft,
    "isVerified": isVerified,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $firstName, $lastName, $email, $phone, $profilePictureUrl, $userPin, $referralCode, $referralRewardsLeft, $isVerified, $createdAt, $updatedAt, ";
  }
}

class UserDeviceDetail {
  UserDeviceDetail({
    this.deviceId,
    this.deviceInfo,
  });

  final String? deviceId;
  final String? deviceInfo;

  UserDeviceDetail copyWith({
    String? deviceId,
    String? deviceInfo,
  }) {
    return UserDeviceDetail(
      deviceId: deviceId ?? this.deviceId,
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }

  factory UserDeviceDetail.fromJson(Map<String, dynamic> json){
    return UserDeviceDetail(
      deviceId: json["deviceId"],
      deviceInfo: json["deviceInfo"],
    );
  }

  Map<String, dynamic> toJson() => {
    "deviceId": deviceId,
    "deviceInfo": deviceInfo,
  };

  @override
  String toString(){
    return "$deviceId, $deviceInfo, ";
  }
}
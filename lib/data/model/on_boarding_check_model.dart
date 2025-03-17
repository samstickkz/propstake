class OnboardingCheckModel {
  OnboardingCheckModel({
    required this.successful,
    required this.message,
    required this.data,
  });

  final bool? successful;
  final String? message;
  final OnboardData? data;

  factory OnboardingCheckModel.fromJson(Map<String, dynamic> json){
    return OnboardingCheckModel(
      successful: json["successful"],
      message: json["message"],
      data: json["data"] == null ? null : OnboardData.fromJson(json["data"]),
    );
  }

}

class OnboardData {
  OnboardData({
    required this.onboardingLevel,
    required this.role,
  });

  final int? onboardingLevel;
  final dynamic role;

  factory OnboardData.fromJson(Map<String, dynamic> json){
    return OnboardData(
      onboardingLevel: json["onboardingLevel"],
      role: json["role"],
    );
  }

}

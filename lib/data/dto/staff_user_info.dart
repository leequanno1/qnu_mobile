class StaffUserInfo {
  final String userId;
  String displayName;
  String fullName;
  String userAvatar;
  String userBackground;
  String departmentId;
  String depName;
  String phoneNumber;

  StaffUserInfo({
    required this.userId,
    required this.displayName,
    required this.fullName,
    required this.userAvatar,
    required this.userBackground,
    required this.departmentId,
    required this.depName,
    required this.phoneNumber,
  });

  factory StaffUserInfo.fromJson(Map<String, dynamic> json) {
    return StaffUserInfo(
      userId: json['userId'] ?? '',
      displayName: json['displayName'] ?? '',
      fullName: json['fullName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      userBackground: json['userBackground'] ?? '',
      departmentId: json['departmentId'] ?? '',
      depName: json['depName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}

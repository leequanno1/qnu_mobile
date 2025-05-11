class UserInfo {
  final String userId;
  final String emailAddress;
  final String displayName;
  final String userAvatar;
  final int userType;

  UserInfo({
    required this.userId,
    required this.emailAddress,
    required this.displayName,
    required this.userAvatar,
    required this.userType,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json['userId'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      displayName: json['displayName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      userType: json['userType'] ?? 0,
    );
  }
}

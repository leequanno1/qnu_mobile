class MemberInfo {
  final String memberId;
  final String userId;
  final String emailAddress;
  final String displayName;
  final String userAvatar;
  final int userType;
  final int roleLevel;

  MemberInfo({
    required this.memberId,
    required this.userId,
    required this.emailAddress,
    required this.displayName,
    required this.userAvatar,
    required this.userType,
    required this.roleLevel,
  });

  factory MemberInfo.fromJson(Map<String, dynamic> json) {
    return MemberInfo(
      memberId: json['memberId'] ?? '',
      userId: json['userId'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      displayName: json['displayName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      userType: json['userType'] ?? 0,
      roleLevel: json['roleLevel'] ?? 0,
    );
  }
}

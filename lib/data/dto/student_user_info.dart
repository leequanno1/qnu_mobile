class StudentUserInfo {
  final String userId;
  final String displayName;
  final String fullName;
  final String userAvatar;
  final String userBackground;
  final String majorId;
  final String majorName;
  final String departmentId;
  final String depName;
  final String courseNumber;
  final String phoneNumber;

  StudentUserInfo({
    required this.userId,
    required this.displayName,
    required this.fullName,
    required this.userAvatar,
    required this.userBackground,
    required this.majorId,
    required this.majorName,
    required this.departmentId,
    required this.depName,
    required this.courseNumber,
    required this.phoneNumber,
  });

  factory StudentUserInfo.fromJson(Map<String, dynamic> json) {
    return StudentUserInfo(
      userId: json['userId'] ?? '',
      displayName: json['displayName'] ?? '',
      fullName: json['fullName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      userBackground: json['userBackground'] ?? '',
      majorId: json['majorId'] ?? '',
      majorName: json['majorName'] ?? '',
      departmentId: json['departmentId'] ?? '',
      depName: json['depName'] ?? '',
      courseNumber: json['courseNumber'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}

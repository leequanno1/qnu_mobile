class OrgDto {
  final String orgId;
  final String orgName;
  final String orgDescription;
  final String orgAvatar;
  final String orgBackground;
  final int members;
  final int posts;
  final int events;
  final DateTime insDate;
  final bool delFlg;

  OrgDto({
    required this.orgId,
    required this.orgName,
    required this.orgDescription,
    required this.orgAvatar,
    required this.orgBackground,
    required this.members,
    required this.posts,
    required this.events,
    required this.insDate,
    required this.delFlg,
  });

  factory OrgDto.fromJson(Map<String, dynamic> json) {
    return OrgDto(
      orgId: json['orgId'] ?? '',
      orgName: json['orgName'] ?? '',
      orgDescription: json['orgDescription'] ?? '',
      orgAvatar: json['orgAvatar'] ?? '',
      orgBackground: json['orgBackground'] ?? '',
      members: json['members'] ?? 0,
      posts: json['posts'] ?? 0,
      events: json['events'] ?? 0,
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
      delFlg: json['delFlg'] ?? false,
    );
  }
}

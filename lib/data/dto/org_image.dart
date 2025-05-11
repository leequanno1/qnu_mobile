class OrgImage {
  final String imageId;
  final String parentId;
  final String imageUrl;
  final DateTime insDate;
  final bool delFlg;

  OrgImage ({
    required this.imageId,
    required this.parentId,
    required this.imageUrl,
    required this.insDate,
    required this.delFlg,
  });

  factory OrgImage.fromJson(Map<String, dynamic> json) {
    return OrgImage(
      imageId: json['imageId'] ?? '',
      parentId: json['parentId'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
      delFlg: json['delFlg'] ?? false,
    );
  }
}

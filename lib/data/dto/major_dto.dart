class MajorDto {
  final String majorId;
  final String departmentId;
  final String majorName;
  final String depName;
  final bool delFlg;
  final DateTime insDate;

  MajorDto({
    required this.majorId,
    required this.departmentId,
    required this.majorName,
    required this.depName,
    required this.delFlg,
    required this.insDate,
  });

  factory MajorDto.fromJson(Map<String, dynamic> json) {
    return MajorDto(
      majorId: json['majorId'] ?? '',
      departmentId: json['departmentId'] ?? '',
      majorName: json['majorName'] ?? '',
      depName: json['depName'] ?? '',
      delFlg: json['delFlg'] ?? false,
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
    );
  }
}

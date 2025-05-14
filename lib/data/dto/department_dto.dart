class DepartmentDto {
  final String departmentId;
  final String depName;
  final int majors;
  final bool delFlg;
  final DateTime insDate;

  DepartmentDto({
    required this.departmentId,
    required this.depName,
    required this.majors,
    required this.delFlg,
    required this.insDate,
  });

  factory DepartmentDto.fromJson(Map<String, dynamic> json) {
    return DepartmentDto(
      departmentId: json['departmentId'] ?? '',
      depName: json['depName'] ?? '',
      majors: json['majors'] ?? 0,
      delFlg: json['delFlg'] ?? false,
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
    );
  }
}

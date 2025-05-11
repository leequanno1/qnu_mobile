import 'package:qnu_mobile/data/dto/org_image.dart';

class EventDto {
  final String eventId;
  final DateTime begin;
  final DateTime end;
  final String hosterId;
  final String eventName;
  final String eventDescription;
  final int participants;
  final DateTime insDate;
  final bool delFlg;
  final bool isApproved;
  final String orgId;
  final List<OrgImage> images;
  final String userId;
  final bool join;

  EventDto({
    required this.eventId,
    required this.begin,
    required this.end,
    required this.hosterId,
    required this.eventName,
    required this.eventDescription,
    required this.participants,
    required this.insDate,
    required this.delFlg,
    required this.isApproved,
    required this.orgId,
    required this.images,
    required this.userId,
    required this.join,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) {
    return EventDto(
      eventId: json['eventId'] ?? '',
      begin: DateTime.tryParse(json['begin'] ?? '') ?? DateTime(1970),
      end: DateTime.tryParse(json['end'] ?? '') ?? DateTime(1970),
      hosterId: json['hosterId'] ?? '',
      eventName: json['eventName'] ?? '',
      eventDescription: json['eventDescription'] ?? '',
      participants: json['participants'] ?? 0,
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
      delFlg: json['delFlg'] ?? false,
      isApproved: json['isApproved'] ?? false,
      orgId: json['orgId'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => OrgImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      userId: json['userId'] ?? '',
      join: json['join'] ?? false,
    );
  }
}

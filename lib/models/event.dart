import 'package:qnu_mobile/models/image.dart';

class Event {
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
  final List<ImageDTO> images;
  final String userId;
  final bool join;

  Event(
      {required this.eventId,
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
      required this.join});
}

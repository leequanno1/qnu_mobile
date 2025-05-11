import 'package:qnu_mobile/data/dto/event_dto.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';

class Event {
  final EventDto eventDto;
  final MemberInfo memberInfo;

  Event(this.eventDto, this.memberInfo);
}

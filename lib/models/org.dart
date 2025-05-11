import 'package:qnu_mobile/data/dto/org_dto.dart';

class Org {
  String orgId;
  String orgName;
  String orgDescription;
  String orgAvatar;
  String orgBackground;
  int members;
  int posts;
  int events;
  DateTime insDate;
  bool delFlg;

  Org({required this.orgId, required this.orgName, required this.orgDescription, required this.orgAvatar, required this.orgBackground, required this.members, required this.posts, required this.events, required this.insDate, required this.delFlg});

  static Org fromDto(OrgDto dto){
    return Org(orgId: dto.orgId, orgName: dto.orgName, orgDescription: dto.orgDescription, orgAvatar: dto.orgAvatar, orgBackground: dto.orgBackground, members: dto.members, posts: dto.posts, events: dto.events, insDate: dto.insDate, delFlg: dto.delFlg);
  }
}
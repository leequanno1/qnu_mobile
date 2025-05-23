import 'package:get/get.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/event_dto.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';
import 'package:qnu_mobile/data/dto/org_image.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class EventController extends GetxController {
  final Map<String, Org> orgs = {};
  final RxList<Event> events = RxList.empty();
  final Map<String, MemberInfo> _members = {};
  StateService stateService = Get.find<StateService>();
  final OrgController _orgController = Get.put(OrgController());
  List<String> curentMemberId = [];

  Future<void> loadEvent() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    // load all post
    orgs.addAll(await _orgController.loadOrgList());
    _getMemberId(orgs.keys.toList());
    dynamic rawPosts = await HttpUtil.post("/api/event/get_all",
        body: {
          "from": 0,
          "to": 1000,
        },
        headers: headerPair);
    CustomResponse<List<EventDto>> postResponses = CustomResponse.convert(
        rawPosts,
        (data) => (data as List)
            .map((item) => EventDto.fromJson(item as Map<String, dynamic>))
            .toList());
    Set<String> userIds =
        postResponses.data.map((item) => item.hosterId).toSet();
    // load user info
    await handleGetMember(userIds, headerPair);
    await handleGetImages(postResponses, headerPair);
    events.value = postResponses.data
        .map((item) => Event(item, _members[item.hosterId]!))
        .toList();
  }

  Future<List<Event>> loadEventByOrgId(String orgId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    // load all post
    dynamic rawPosts = await HttpUtil.post("/api/event/get_in_org",
        body: {
          "orgId": orgId,
          "offset": {
            "from": 0,
            "to": 1000,
          }
        },
        headers: headerPair);
    CustomResponse<List<EventDto>> postResponses = CustomResponse.convert(
        rawPosts,
        (data) => (data as List)
            .map((item) => EventDto.fromJson(item as Map<String, dynamic>))
            .toList());
    Set<String> userIds =
        postResponses.data.map((item) => item.hosterId).toSet();
    // load user info
    await handleGetMember(userIds, headerPair);
    await handleGetImages(postResponses, headerPair);
    return postResponses.data
        .map((item) => Event(item, _members[item.hosterId]!))
        .toList();
  }

  Future<void> handleGetImages(CustomResponse<List<EventDto>> postResponses,
      Map<String, String> headerPair) async {
    dynamic rawImages = await HttpUtil.post("/api/image/get-images",
        body: {
          "parentIds": postResponses.data.map((item) => item.eventId).toList(),
        },
        headers: headerPair);
    CustomResponse<List<OrgImage>> imageResponses = CustomResponse.convert(
        rawImages,
        (data) => (data as List)
            .map((item) => OrgImage.fromJson(item as Map<String, dynamic>))
            .toList());
    for (var item in postResponses.data) {
      item.images.addAll(getImageList(imageResponses.data, item.eventId));
    }
  }

  List<OrgImage> getImageList(List<OrgImage> data, String postId) {
    return data.where((item) => item.parentId == postId).toList();
  }

  Future<void> handleGetMember(
      Set<String> userIds, Map<String, String> headerPair) async {
    dynamic rawMember = await HttpUtil.post("/api/member/get_member_info",
        body: {
          "memberIds": userIds.toList(),
        },
        headers: headerPair);
    CustomResponse<List<MemberInfo>> memberResponses = CustomResponse.convert(
        rawMember,
        (data) => (data as List)
            .map((item) => MemberInfo.fromJson(item as Map<String, dynamic>))
            .toList());
    for (var item in memberResponses.data) {
      _members.addIf(!_members.containsKey(item.memberId), item.memberId, item);
    }
  }

  Future<void> _getMemberId(List<String> orgIds) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };

    curentMemberId.clear();

    for (String id in orgIds) {
      CustomResponse<MemberInfo> response = CustomResponse.convert(await HttpUtil.post("/api/member/get_info_by_user_id_and_org_id",
        body: {"userId": stateService.userInfo.value?.userId, "orgId": id}, headers: headerPair), 
        (json) => MemberInfo.fromJson(json));
      curentMemberId.add(response.data.memberId);
    }
  }

  Future<void> followOrUnfollow(Event event) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };

    try {
      if(event.eventDto.join) {
        await _outEvent(event, headerPair);
      } else {
        await _joinEvent(event, headerPair);
      }
    int index = events.indexOf(event);
    event.eventDto.join = !event.eventDto.join;
    events[index] = event;
    } catch (e) { }
  }

  Future<void> _joinEvent(Event event, Map<String, String> headerPair) async {
    await HttpUtil.post(
    "/api/event/join_event",
    body: {
      "eventId": event.eventDto.eventId
    },
    headers: headerPair
        );
  }

  Future<void> _outEvent(Event event, Map<String, String> headerPair) async {
    await HttpUtil.post(
    "/api/event/out_event",
    body: {
      "eventId": event.eventDto.eventId
    },
    headers: headerPair
        );
  }
}

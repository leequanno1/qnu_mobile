import 'package:get/get.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/event_dto.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';
import 'package:qnu_mobile/data/dto/org_image.dart';
import 'package:qnu_mobile/data/dto/post_dto.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ContentModerationController extends GetxController {
  // switch flag
  final RxInt _switchFlag = 0.obs;
  final RxString orgId = "".obs;
  final RxList<Post> _posts = RxList.empty();
  final RxList<Event> _event = RxList.empty();
  final RxMap<String, MemberInfo> _members = RxMap();
  final StateService stateService = Get.find<StateService>();
  late String adminId;

  static const int postEnable = 0;
  static const int eventEnable = 1;
  RxInt get switchFlag => _switchFlag;
  RxList<Post> get posts => _posts;
  RxList<Event> get event => _event;

  @override
  void onInit() {
    super.onInit();
    List arguments = Get.arguments as List;
    orgId.value = arguments[1] as String;
    select(arguments[0] as int);
    adminId = arguments[2] as String;
  }

  Future<void> select(int selectValue) async {
    _switchFlag.value = selectValue;
    switch (selectValue) {
      case postEnable:
        _loadPosts();
        break;
      case eventEnable:
        _loadEvents();
        break;
    }
  }

  Future<void> _loadPosts() async {
    _posts.clear();
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    var rawResponse = await HttpUtil.post("/api/post/get_not_approved_in_org",
        body: {
          "orgId": orgId.value,
          "offset": {"from": 0, "to": 1000}
        },
        headers: headerPair);

    CustomResponse<List<PostDto>> postResponses = CustomResponse.convert(
      rawResponse,
      (data) => (data as List)
          .map((item) => PostDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    // get unique memberIds
    Set<String> memberIds =
        postResponses.data.map((item) => item.posterId).toSet();
    // call get member info
    await handleGetMemberInfo(memberIds, headerPair);
    // call get all image
    List<OrgImage> images = await handleGetImages(postResponses.data.map((item) => item.postId).toList(), headerPair);
    for (var item in postResponses.data) {
      item.images = getImageList(images, item.postId);
      _posts.add(Post(item, _members[item.posterId]!));
    }
  }

  Future<void> _loadEvents() async {
    _event.clear();
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    var rawResponse = await HttpUtil.post("/api/event/get_not_approved_in_org",
        body: {
          "orgId": orgId.value,
          "offset": {"from": 0, "to": 1000}
        },
        headers: headerPair);

    CustomResponse<List<EventDto>> postResponses = CustomResponse.convert(
      rawResponse,
      (data) => (data as List)
          .map((item) => EventDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    // get unique memberIds
    Set<String> memberIds =
        postResponses.data.map((item) => item.hosterId).toSet();
    // call get member info
    await handleGetMemberInfo(memberIds, headerPair);
    List<OrgImage> images = await handleGetImages(postResponses.data.map((item) => item.eventId).toList(), headerPair);
    for (var item in postResponses.data) {
      item.images = getImageList(images, item.eventId);
      _event.add(Event(item, _members[item.hosterId]!));
    }
  }

  Future<void> handleGetMemberInfo(
      Set<String> memberIds, Map<String, String> headerPair) async {
    dynamic rawMemInfo = await HttpUtil.post("/api/member/get_member_info",
        body: {'memberIds': memberIds.toList()}, headers: headerPair);
    CustomResponse<List<MemberInfo>> memberInfoResponses =
        CustomResponse.convert(
            rawMemInfo,
            (data) => (data as List)
                .map(
                    (item) => MemberInfo.fromJson(item as Map<String, dynamic>))
                .toList());
    for (var item in memberInfoResponses.data) {
      _members.addIf(!_members.containsKey(item.memberId), item.memberId, item);
    }
  }

  Future<void> handleApprovePost(String postId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    await HttpUtil.post("/api/post/approve",
        headers: headerPair, body: {"approvalId": adminId, "postId": postId});
  }

  Future<void> handleApproveEvent(String eventId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    await HttpUtil.post("/api/event/approve",
        headers: headerPair,
        body: {"approvalId": adminId, "eventId": eventId});
  }

  Future<void> handleDeletePost(String postId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    await HttpUtil.delete("/api/post/delete",
        headers: headerPair, body: {"posterId": adminId, "postId": postId});
  }

  Future<void> handleDeleteEvent(String eventId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    await HttpUtil.delete(
      "/api/event/delete",
        headers: headerPair,
        body: {"hosterId": adminId, "eventId": eventId}
    );
  }

  Future<List<OrgImage>> handleGetImages(List<String> ids,
      Map<String, String> headerPair) async {
    dynamic rawImages = await HttpUtil.post("/api/image/get-images",
        body: {
          "parentIds": ids,
        },
        headers: headerPair);
    CustomResponse<List<OrgImage>> imageResponses = CustomResponse.convert(
        rawImages,
        (data) => (data as List)
            .map((item) => OrgImage.fromJson(item as Map<String, dynamic>))
            .toList());
    return imageResponses.data;
  }

  List<OrgImage> getImageList(List<OrgImage> data, String postId) {
    return data.where((item) => item.parentId == postId).toList();
  }
}

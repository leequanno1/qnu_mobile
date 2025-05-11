import 'package:get/get.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/event_dto.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';
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

  static const int postEnable = 0;
  static const int eventEnable = 1;
  RxInt get switchFlag => _switchFlag;
  RxList<Post> get posts => _posts;
  RxList<Event> get event => _event;

  @override
  void onInit() {
    super.onInit();
    int selectValue = Get.arguments as int;
    select(selectValue);
  }

  Future<void> select(int selectValue) async {
    _switchFlag.value = selectValue;
    switch (selectValue) {
      case postEnable:
        await _loadPosts();
        break;
      case eventEnable:
        _loadEvents();
        break;
    }
  }

  Future<void> _loadPosts() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    var rawResponse = await HttpUtil.post("/api/post/get_not_approved_in_org",
        body: {"orgId": orgId.value, "offset":{"from": 0, "to": 1000}}, headers: headerPair);

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
    _posts.clear();
    for (var item in postResponses.data) {
      _posts.add(Post(item, _members[item.posterId]!));
    }
  }

  Future<void> _loadEvents() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    var rawResponse = await HttpUtil.post("/api/event/get_not_approved_in_org",
        body: {"orgId": orgId.value, "offset":{"from": 0, "to": 1000}}, headers: headerPair);

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
    _event.clear();
    for (var item in postResponses.data) {
      _event.add(Event(item, _members[item.hosterId]!));
    }
  }


  Future<void> handleGetMemberInfo(Set<String> memberIds, Map<String, String> headerPair) async {
    dynamic rawMemInfo = await HttpUtil.post("/api/member/get_member_info", body: {'memberIds': memberIds.toList()}, headers: headerPair);
    CustomResponse<List<MemberInfo>> memberInfoResponses = CustomResponse.convert(rawMemInfo, 
      (data) => (data as List)
      .map((item) => MemberInfo.fromJson(item as Map<String, dynamic>))
      .toList()
    );
    for (var item in memberInfoResponses.data) {
      _members.addIf(!_members.containsKey(item.memberId), item.memberId, item);
    }
  }

}

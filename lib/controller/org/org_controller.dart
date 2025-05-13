import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main/event_controller.dart';
import 'package:qnu_mobile/controller/main/post_controller.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';
import 'package:qnu_mobile/data/dto/org_dto.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class OrgController extends GetxController {
  RxInt _switchButtonIndex = 1.obs;
  final RxBool isAdmin = false.obs;
  final RxList<Post> _posts = RxList.empty();
  final RxList<Event> _events = RxList.empty();
  final RxMap<String, Org> _orgList = RxMap({});
  late Org _org;
  final StateService stateService = Get.find<StateService>();

  int get postIndex => 1;
  int get eventIndex => 2;
  RxInt get switchButtonIndex => _switchButtonIndex;
  RxList<Post> get posts => _posts;
  RxList<Event> get events => _events;
  Org get org => _org;

  void resetRepo() async {
    _switchButtonIndex = postIndex.obs;
    _posts.clear();
    _events.clear();
    PostController postController = Get.put(PostController());
    EventController eventController = Get.put(EventController());
    _posts.value = await postController.loadPostByOrgId(org.orgId);
    _events.value = await eventController.loadEventByOrgId(org.orgId);
    isAdmin.value = (await getMemberInfoByOrgIdAndUserId(stateService.userInfo.value!.userId, _org.orgId)).roleLevel == 2;
  }

  void switchButtonTap(int switchIndex) {
    _switchButtonIndex.value = switchIndex;
  }

  Future<Map<String,Org>> loadOrgList() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    dynamic rawResponse = await HttpUtil.get(
        "/api/organization/get_by_user_id?userId=${stateService.userInfo.value?.userId}",
        headers: headerPair);
    CustomResponse<List<OrgDto>> orgResponses = CustomResponse.convert(
        rawResponse,
        (data) => (data as List)
            .map((item) => OrgDto.fromJson(item as Map<String, dynamic>))
            .toList());
    Map<String,Org> orgMap = {};
    for(var item in orgResponses.data){
      orgMap.addIf(true, item.orgId, Org.fromDto(item));
    }
    _orgList.addAll(orgMap);
    return orgMap;
  }

  Future<MemberInfo> getMemberInfoByOrgIdAndUserId(String userId, String orgId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    dynamic rawResponse = await HttpUtil.post(
        "/api/member/get_info_by_user_id_and_org_id",
        body: {
          "userId": userId,
          "orgId": orgId
        },
        headers: headerPair);
    CustomResponse<MemberInfo> memInfoResponse = CustomResponse.convert(rawResponse, (json) => MemberInfo.fromJson(json));
    return memInfoResponse.data;
  }

  void setSelectedOrg(String orgId){
    _org = _orgList[orgId]!;
  }

  List<Org> getOrgList() {
    return _orgList.values.toList();
  }
}

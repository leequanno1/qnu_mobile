import 'package:get/get.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/member_info.dart';
import 'package:qnu_mobile/data/dto/org_image.dart';
import 'package:qnu_mobile/data/dto/post_dto.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class PostController extends GetxController {
  final RxList<Post> posts = RxList.empty();
  final Map<String, Org> orgs = {};
  final Map<String, MemberInfo> _members = {};
  StateService stateService = Get.find<StateService>();
  final OrgController _orgController = Get.put(OrgController());

  Future<void> loadPost() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };

    orgs.addAll(await _orgController.loadOrgList("4451190096"));
    // load all post
    dynamic rawPosts = await HttpUtil.post("/api/post/get_all",
        body: {
          "from": 0,
          "to": 1000,
        },
        headers: headerPair);
    CustomResponse<List<PostDto>> postResponses = CustomResponse.convert(
        rawPosts,
        (data) => (data as List)
            .map((item) => PostDto.fromJson(item as Map<String, dynamic>))
            .toList());
    Set<String> userIds =
        postResponses.data.map((item) => item.posterId).toSet();
    // load user info
    await handleGetMember(userIds, headerPair);
    // get images
    await handleGetImages(postResponses, headerPair);
    posts.value = postResponses.data
        .map((item) => Post(item, _members[item.posterId]!))
        .toList();
  }

  Future<void> handleGetImages(CustomResponse<List<PostDto>> postResponses,
      Map<String, String> headerPair) async {
    dynamic rawImages = await HttpUtil.post("/api/image/get-images",
        body: {
          "parentIds": postResponses.data.map((item) => item.postId).toList(),
        },
        headers: headerPair);
    CustomResponse<List<OrgImage>> imageResponses = CustomResponse.convert(
        rawImages,
        (data) => (data as List)
            .map((item) => OrgImage.fromJson(item as Map<String, dynamic>))
            .toList());
    for (var item in postResponses.data) {
      item.images.addAll(getImageList(imageResponses.data, item.postId));
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

  Future<List<Post>> loadPostByOrgId(String orgId) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    // load all post
    dynamic rawPosts = await HttpUtil.post("/api/post/get_in_org",
        body: {
          "orgId": orgId,
          "offset": {
            "from": 0,
            "to": 1000,
          }
        },
        headers: headerPair);
    CustomResponse<List<PostDto>> postResponses = CustomResponse.convert(
        rawPosts,
        (data) => (data as List)
            .map((item) => PostDto.fromJson(item as Map<String, dynamic>))
            .toList());
    Set<String> userIds =
        postResponses.data.map((item) => item.posterId).toSet();
    // load user info
    await handleGetMember(userIds, headerPair);
    // get images
    await handleGetImages(postResponses, headerPair);
    return postResponses.data
        .map((item) => Post(item, _members[item.posterId]!))
        .toList();
  }
}

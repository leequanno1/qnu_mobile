import 'package:get/get.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/image.dart';
import 'package:qnu_mobile/models/post.dart';

class ContentModerationController extends GetxController {
  // switch flag
  final RxInt _switchFlag = 0.obs;
  final RxList<Post> _posts = RxList.empty();
  final RxList<Event> _event = RxList.empty();

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

  void select(int selectValue) {
    _switchFlag.value = selectValue;
    switch(selectValue){
      case postEnable:
        _loadPosts();
        break;
      case eventEnable:
        _loadEvents();
        break;
    }
  }

  void _loadPosts(){
    _posts.addAll([
      Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]),
      Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]),
      Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]),
    ]);
  }

  void _loadEvents(){
    _event.addAll([
      Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false),
      Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false),
      Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false),
    ]);
  }
}
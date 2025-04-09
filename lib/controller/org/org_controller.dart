import 'package:get/get.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/image.dart';
import 'package:qnu_mobile/models/post.dart';

class OrgController extends GetxController {
  RxInt _switchButtonIndex = 1.obs;
  final RxList<Post> _posts = RxList.empty();
  final RxList<Event> _events = RxList.empty();

  int get postIndex => 1;
  int get eventIndex => 2;
  RxInt get switchButtonIndex => _switchButtonIndex;
  RxList<Post> get posts => _posts;
  RxList<Event> get events => _events;

  void resetRepo(){
    _switchButtonIndex = postIndex.obs;
    _posts.clear();
    _events.clear();
    _posts.add(Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]));
    _posts.add(Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]));
    _posts.add(Post(postId: "postId",posterId: "posterId",postTitle: "postTitle",postContent: "postContent asdasd as \n asdasd \n asdasd",comments: 0,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),]));
    _events.add(Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false));
    _events.add(Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false));
    _events.add(Event(eventId: "eventId",begin: DateTime.now(),end: DateTime.now(),hosterId: "hosterId",eventName: "eventName",eventDescription: "eventDescription",participants: 10,insDate: DateTime.now(),delFlg: false,isApproved: true,orgId: "orgId",images: [ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),],userId: "userId",join: false));
    // TODO: get new post
  }

  void switchButtonTap(int switchIndex){
    _switchButtonIndex.value = switchIndex;
  }
}
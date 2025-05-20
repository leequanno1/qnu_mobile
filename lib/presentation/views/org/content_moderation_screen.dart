import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/content_moderation_controller.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/views/org/private_event_view.dart';
import 'package:qnu_mobile/presentation/views/org/private_post_view.dart';
import 'package:qnu_mobile/utils/toast_ultil.dart';

class ContentModerationScreen extends GetView<ContentModerationController> {
  ContentModerationScreen({super.key});
  final ContentModerationController _controller =
        Get.find<ContentModerationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        shape: Border(bottom: BorderSide(color: AppColors.outline, width: 1.0)),
        title: SizedBox(width: double.maxFinite, child: Text("Organization name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          // button zone
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: (Get.width-30)/2,
                      child: ElevatedButton(
                          onPressed: () => _controller
                              .select(ContentModerationController.postEnable),
                          style: _controller.switchFlag.value ==
                                  ContentModerationController.postEnable
                              ? switchButtonSeleted
                              : switchButtonUnseleted,
                          child: Text("Bài viết")),
                    ),
                    SizedBox(
                      width: (Get.width-30)/2,
                      child: ElevatedButton(
                          onPressed: () => _controller
                              .select(ContentModerationController.eventEnable),
                          style: _controller.switchFlag.value ==
                                  ContentModerationController.eventEnable
                              ? switchButtonSeleted
                              : switchButtonUnseleted,
                          child: Text("Sự kiện")),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // item list
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: _controller.switchFlag.value ==
                          ContentModerationController.postEnable
                      ? _controller.posts.length
                      : _controller.event.length,
                  itemBuilder: (context, index) {
                    return _controller.switchFlag.value ==
                            ContentModerationController.postEnable
                        ? _PrivatePostView(_controller.posts[index], _controller)
                        : _PrivateEventView(
                            _controller.event[index], _controller);
                  },
                )),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _PrivatePostView(Post post, ContentModerationController controller) {
    return Column(
      children: [
        PrivatePostView(post: post),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          // call API loại
                          controller.posts.remove(post);
                          await controller.handleDeletePost(post.postDto.postId);
                          ToastUltil.showToast("Loại thành công bài viết của ${post.memberInfo.displayName}");
                        },
                        style: redBackgroundButton,
                        child: Text("Loại", style: TextStyle(fontWeight: FontWeight.normal)))),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          // call API duyệt
                          controller.posts.remove(post);
                          await controller.handleApprovePost(post.postDto.postId);
                          ToastUltil.showToast("Duyệt thành công bài viết của ${post.memberInfo.displayName}");
                        },
                        style: buttonPrimary,
                        child: Text("Duyệt", style: TextStyle(fontWeight: FontWeight.normal),),)),
              ],
            ),
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _PrivateEventView(
      Event event, ContentModerationController controller) {
    return Column(
      children: [
        PrivateEventView(eventItem: event, forApproved: true,),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          //call API loại
                          controller.event.remove(event);
                          await controller.handleDeleteEvent(event.eventDto.eventId);
                          ToastUltil.showToast("Loại thành công sự kiện của ${event.memberInfo.displayName}");
                        },
                        style: redBackgroundButton,
                        child: Text("Loại", style: TextStyle(fontWeight: FontWeight.normal)))),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          //call API duyệt
                          controller.event.remove(event);
                          await controller.handleApproveEvent(event.eventDto.eventId);
                          ToastUltil.showToast("Duyệt thành công sự kiện của ${event.memberInfo.displayName}");
                        },
                        style: buttonPrimary,
                        child: Text("Duyệt", style: TextStyle(fontWeight: FontWeight.normal)))),
              ],
            ),
          ),
        )
      ],
    );
  }
}

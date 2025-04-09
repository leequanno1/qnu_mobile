import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/views/org/private_event_view.dart';
import 'package:qnu_mobile/presentation/views/org/private_post_view.dart';

class OrgScreen extends GetView<OrgController> {
  const OrgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrgController controller = Get.find<OrgController>();
    controller.resetRepo();
    // reset switch button index;
    // get init post data
    // return Placeholder();

    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: AppColors.outline)),
        title: SizedBox(
            width: double.maxFinite,
            child: Text("Organization name",
                style: TextStyle(color: Colors.black))),
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(PhosphorIconsBold.caretLeft)),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: const Text("Duyệt bài viết",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    child: const Text("Duyệt sự kiện",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    child: const Text("Chỉnh sửa thông tin",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    child: const Text("Tạo bài viết",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    child: const Text("Tạo sự kiện",
                        style: TextStyle(color: Colors.black))),
              ];
            },
          )
        ],
      ),
      body: ListView(
        children: [
          // back ground
          Container(
            margin: EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.outline,
            ),
          ),
          // group name
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                Text(
                  "Organization name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Icon(PhosphorIconsBold.caretRight)
              ],
            ),
          ),
          // group member
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "Thành viên: 10 người.",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )),
          ),
      
          // Swtich button
          Obx(
            () => Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: AppColors.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (Get.width - 30) / 2,
                    margin: EdgeInsets.only(left: 2.0),
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.switchButtonTap(controller.postIndex),
                        style: controller.switchButtonIndex.value ==
                                controller.postIndex
                            ? switchButtonSeleted
                            : switchButtonUnseleted,
                        child: Text("Bài viết")),
                  ),
                  Container(
                    width: (Get.width - 30) / 2,
                    margin: EdgeInsets.only(right: 2.0),
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.switchButtonTap(controller.eventIndex),
                        style: controller.switchButtonIndex.value ==
                                controller.eventIndex
                            ? switchButtonSeleted
                            : switchButtonUnseleted,
                        child: Text("Sự kiện")),
                  ),
                ],
              ),
            ),
          ),
      
          Obx(() => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                controller.switchButtonIndex.value == controller.postIndex
                    ? controller.posts.length
                    : controller.events.length,
            itemBuilder: (context, index) {
              return controller.switchButtonIndex.value ==
                      controller.postIndex
                  ? PrivatePostView(post: controller.posts[index])
                  : PrivateEventView(eventItem: controller.events[index]);
            },
          ))
        ],
      ),
    );
  }
}



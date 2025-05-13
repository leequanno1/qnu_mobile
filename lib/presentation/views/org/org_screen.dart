import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/change_group_info_controller.dart';
import 'package:qnu_mobile/controller/org/content_moderation_controller.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/views/org/change_group_info_view.dart';
import 'package:qnu_mobile/presentation/views/org/create_event_view.dart';
import 'package:qnu_mobile/presentation/views/org/create_post_view.dart';
import 'package:qnu_mobile/presentation/views/org/private_event_view.dart';
import 'package:qnu_mobile/presentation/views/org/private_post_view.dart';
import 'package:qnu_mobile/presentation/views/org/view_org_info_view.dart';
import 'package:qnu_mobile/routes/route_name.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class OrgScreen extends GetView<OrgController> {
  const OrgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrgController controller = Get.find<OrgController>();
    controller.resetRepo();

    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: AppColors.outline)),
        title: SizedBox(
            width: double.maxFinite,
            child: Text(controller.org.orgName,
                style: TextStyle(color: Colors.black))),
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(PhosphorIconsBold.caretLeft)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case 0:
                  Get.toNamed(RouteNames.contentModeration,
                      arguments: [ContentModerationController.postEnable,controller.org.orgId]);
                  break;
                case 1:
                  Get.toNamed(RouteNames.contentModeration,
                      arguments: [ContentModerationController.eventEnable,controller.org.orgId]);
                  break;
                case 2:
                  Get.put(ChangeGroupInfoController()).setOrg(controller.org);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Full height
                    builder: (context) {
                      return ChangeGroupInfoView();
                    },
                  );
                  break;
                case 3:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Full height
                    builder: (context) => CreatePostView(org: controller.org),
                  );
                  break;
                case 4:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Full height
                    builder: (context) => CreateEventView(org: controller.org),
                  );
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    enabled: controller.isAdmin.value,
                    value: 0,
                    child: Text("Duyệt bài viết",
                        style: TextStyle(color: controller.isAdmin.value ?Colors.black: AppColors.disableButton))),
                PopupMenuItem(
                    enabled: controller.isAdmin.value,
                    value: 1,
                    child: Text("Duyệt sự kiện",
                        style: TextStyle(color: controller.isAdmin.value ?Colors.black: AppColors.disableButton))),
                PopupMenuItem(
                    value: 2,
                    child: const Text("Chỉnh sửa thông tin",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    value: 3,
                    child: const Text("Tạo bài viết",
                        style: TextStyle(color: Colors.black))),
                PopupMenuItem(
                    value: 4,
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
            child: Image.network(
              HttpUtil.mapUrl(controller.org.orgBackground),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image(image: AssetImage("assets/images/empty.png"),),
            ),
          ),
          // group name
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Full height
                  builder: (context) => ViewOrgInfoView(),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.org.orgName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(PhosphorIconsBold.caretRight)
                ],
              ),
            ),
          ),
          // group member
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "Thành viên: ${controller.org.members} người.",
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

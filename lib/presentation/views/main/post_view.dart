import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/post_controller.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/routes/route_name.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.find();
    // controller.posts.clear();
    controller.loadPost();
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            return _PublicPostItem(
              post: controller.posts[index],
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}

class _PublicPostItem extends StatelessWidget {
  final Post post;
  final PostController controller;

  const _PublicPostItem({required this.post, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.articalBackground,
            border: Border.all(color: AppColors.outline),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              // header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<OrgController>().setSelectedOrg(
                          controller.orgs[post.postDto.orgId]!.orgId);
                      Get.toNamed(RouteNames.org);
                    },
                    child: Text(
                      controller.orgs[post.postDto.orgId]!.orgName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            HttpUtil.mapUrl(post.memberInfo.userAvatar),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/empty.png',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.memberInfo.displayName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(DateTimeFormat.toDateTime(post.postDto.insDate),
                              style: TextStyle(color: Colors.black))
                        ],
                      )
                    ],
                  )
                ],
              ),
              // text
              Text(post.postDto.postTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(post.postDto.postContent,
                  style: TextStyle(color: Colors.black), maxLines: 5, overflow: TextOverflow.ellipsis,),
              // images
              if (post.postDto.images.isNotEmpty)
                Container(
                  height: 180,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: post.postDto.images.length,
                    itemBuilder: (context, index) {
                      double boxWidth = MediaQuery.of(context).size.width - 43;
                      if (post.postDto.images.length > 2) {
                        boxWidth = 135;
                      } else if (post.postDto.images.length > 1) {
                        boxWidth = (boxWidth - 10) / 2;
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: SizedBox(
                              width: boxWidth,
                              height: 190,
                              child: ImageContainer(
                                  imageDTO: post.postDto.images[index])),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Container(
                          height: 190,
                          width: boxWidth,
                          margin: EdgeInsets.only(right: 5),
                          child: ImageContainer(
                              imageDTO: post.postDto.images[index]),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

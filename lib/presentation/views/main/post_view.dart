import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/post_controller.dart';
import 'package:qnu_mobile/models/image.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background
      ),
      child: ListView(
        children: [
          _PublicPostItem(
            post: Post(
                postId: "postId",
                posterId: "posterId",
                postTitle: "postTitle",
                postContent: "postContent asdasd as \n asdasd \n asdasd",
                comments: 0,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                ]),
          ),
          _PublicPostItem(
            post: Post(
                postId: "postId",
                posterId: "posterId",
                postTitle: "postTitle",
                postContent: "postContent asdasd as \n asdasd \n asdasd",
                comments: 0,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                ]),
          ),
          _PublicPostItem(
            post: Post(
                postId: "postId",
                posterId: "posterId",
                postTitle: "postTitle",
                postContent: "postContent asdasd as \n asdasd \n asdasd",
                comments: 0,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                  ImageDTO(imageId: "imageId",parentId: "parentId",imageUrl: "imageUrl",insDate: DateTime.now(),delFlg: false),
                ]),
          )
        ],
      ),
    );
  }
}

class _PublicPostItem extends StatelessWidget {
  final Post post;

  const _PublicPostItem({required this.post});

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
                  Text(
                    post.orgId,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
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
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.posterId,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(DateTimeFormat.toDateTime(post.insDate),
                              style: TextStyle(color: Colors.black))
                        ],
                      )
                    ],
                  )
                ],
              ),
              // text
              Text(post.postTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(post.postContent, style: TextStyle(color: Colors.black)),
              // images
              if(post.images.isNotEmpty)
                Container(
                  height: 180,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: post.images.length,
                    itemBuilder: (context, index) {
                      double boxWidth = MediaQuery.of(context).size.width - 43;
                      if(post.images.length > 2){
                        boxWidth = 135;
                      } else if (post.images.length > 1){
                        boxWidth = (boxWidth - 10)/2;
                      } else {
                        return SizedBox(
                          width: boxWidth,
                          height: 180,
                          child: ImageContainer(imageDTO: post.images[index]));
                      }
                      return Container(
                        height: 180,
                        width: boxWidth,
                        margin: EdgeInsets.only(right: 5),
                        child: ImageContainer(imageDTO: post.images[index]),
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

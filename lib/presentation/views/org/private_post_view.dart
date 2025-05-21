import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/post.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class PrivatePostView extends StatelessWidget {
  final Post post;
  final OrgController? controller;
  final bool forApproved;
  const PrivatePostView({
    super.key,
    required this.post, required this.controller,this.forApproved = false,
  });

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
              Row(
                spacing: 10,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      Text(
                        post.memberInfo.displayName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(DateTimeFormat.toDateTime(post.postDto.insDate),
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Spacer(),
                  if(!forApproved && controller?.memberInfo.memberId == post.postDto.posterId)
                  PopupMenuButton(
                    onSelected: (value) async {
                      switch (value) {
                        case 0:
                          controller?.deletePost(post);
                          break;
                        default:
                      }
                    },
                    itemBuilder: (context) => [
                    PopupMenuItem(value: 0, child: Text("Xóa"))
                  ],)
                ],
              ),
              // text
              Text(post.postDto.postTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(
                post.postDto.postContent,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
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
                        return SizedBox(
                            width: boxWidth,
                            height: 180,
                            child: ImageContainer(
                                imageDTO: post.postDto.images[index]));
                      }
                      return Container(
                        height: 180,
                        width: boxWidth,
                        margin: EdgeInsets.only(right: 5),
                        child: ImageContainer(
                            imageDTO: post.postDto.images[index]),
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

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class PrivateEventView extends StatelessWidget {
  final Event eventItem;
  final OrgController? controller;
  final bool forApproved;
  const PrivateEventView(
      {super.key, required this.eventItem, required this.controller, this.forApproved = false,});

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
                            HttpUtil.mapUrl(eventItem.memberInfo.userAvatar),
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
                        eventItem.memberInfo.displayName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                          DateTimeFormat.toDateTime(eventItem.eventDto.insDate),
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Spacer(),
                  if (!forApproved && eventItem.eventDto.hosterId != controller?.memberInfo.memberId)
                    SizedBox(
                      height: 40,
                      width: 115,
                      child: ElevatedButton(
                          onPressed:
                              eventItem.eventDto.begin.isBefore(DateTime.now())
                                  ? null
                                  : () async {
                                    controller?.followOrUnfollow(eventItem);
                                  },
                          style: borderButtonEnable,
                          child: eventItem.eventDto.join
                              ? Text(
                                  "Đã đăng ký",
                                  style: TextStyle(fontSize: 12),
                                )
                              : Text("Đăng ký",
                                  style: TextStyle(fontSize: 12))),
                    ),
                  if (!forApproved && eventItem.eventDto.hosterId == controller?.memberInfo.memberId)
                    PopupMenuButton(
                      icon: Icon(PhosphorIconsBold.dotsThreeVertical),
                      onSelected: (value) async {
                        switch (value) {
                          case 0:
                            controller?.deleteEvent(eventItem);
                            break;
                          default:
                        }
                      },
                      itemBuilder: (context) => [
                      PopupMenuItem(value: 0, child: Text("Xóa"))
                    ],)
                ],
              ),
              // time
              Row(
                children: [
                  Text(
                    DateTimeFormat.toDateTime(eventItem.eventDto.begin),
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                    height: 10,
                  ),
                  Text(
                    DateTimeFormat.toDateTime(eventItem.eventDto.end),
                    style: TextStyle(
                        color: AppColors.textRed,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // text
              Text(eventItem.eventDto.eventName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(
                eventItem.eventDto.eventDescription,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              // images
              if (eventItem.eventDto.images.isNotEmpty)
                Container(
                  height: 180,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: eventItem.eventDto.images.length,
                    itemBuilder: (context, index) {
                      double boxWidth = MediaQuery.of(context).size.width - 43;
                      if (eventItem.eventDto.images.length > 2) {
                        boxWidth = 135;
                      } else if (eventItem.eventDto.images.length > 1) {
                        boxWidth = (boxWidth - 10) / 2;
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: SizedBox(
                              width: boxWidth,
                              height: 190,
                              child: ImageContainer(
                                  imageDTO: eventItem.eventDto.images[index])),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Container(
                          height: 190,
                          width: boxWidth,
                          margin: EdgeInsets.only(right: 5),
                          child: ImageContainer(
                              imageDTO: eventItem.eventDto.images[index]),
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

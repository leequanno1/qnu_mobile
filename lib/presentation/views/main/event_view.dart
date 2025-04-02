import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/event_controller.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/models/image.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: ListView(
        children: [
          _PublicEventItem(
            event: Event(
                eventId: "eventId",
                begin: DateTime.now(),
                end: DateTime.now(),
                hosterId: "hosterId",
                eventName: "eventName",
                eventDescription: "eventDescription",
                participants: 10,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                ],
                userId: "userId",
                join: false),
          ),
          _PublicEventItem(
            event: Event(
                eventId: "eventId",
                begin: DateTime.now(),
                end: DateTime.now(),
                hosterId: "hosterId",
                eventName: "eventName",
                eventDescription: "eventDescription",
                participants: 10,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                ],
                userId: "userId",
                join: false),
          ),
          _PublicEventItem(
            event: Event(
                eventId: "eventId",
                begin: DateTime.now(),
                end: DateTime.now(),
                hosterId: "hosterId",
                eventName: "eventName",
                eventDescription: "eventDescription",
                participants: 10,
                insDate: DateTime.now(),
                delFlg: false,
                isApproved: true,
                orgId: "orgId",
                images: [
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                  ImageDTO(
                      imageId: "imageId",
                      parentId: "parentId",
                      imageUrl: "imageUrl",
                      insDate: DateTime.now(),
                      delFlg: false),
                ],
                userId: "userId",
                join: false),
          ),
        ],
      ),
    );
  }
}

class _PublicEventItem extends StatelessWidget {
  final Event event;

  const _PublicEventItem({required this.event});

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
                    event.orgId,
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
                          Text(event.hosterId,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(DateTimeFormat.toDateTime(event.insDate),
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 45,
                        width: 140,
                        child: ElevatedButton(
                            onPressed: event.begin.isBefore(DateTime.now())?null:(){},
                            style: borderButtonEnable,
                            child: event.join
                                ? Text("Đã đăng ký")
                                : Text("Đăng ký")),
                      )
                    ],
                  )
                ],
              ),
              // time
              Row(
                children: [
                  Text(DateTimeFormat.toDateTime(event.begin), style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 30, height: 10,),
                  Text(DateTimeFormat.toDateTime(event.end), style: TextStyle(color: AppColors.textRed, fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
              // text
              Text(event.eventName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(event.eventDescription,
                  style: TextStyle(color: Colors.black)),
              // images
              if (event.images.isNotEmpty)
                Container(
                  height: 180,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: event.images.length,
                    itemBuilder: (context, index) {
                      double boxWidth = MediaQuery.of(context).size.width - 43;
                      if (event.images.length > 2) {
                        boxWidth = 135;
                      } else if (event.images.length > 1) {
                        boxWidth = (boxWidth - 10) / 2;
                      } else {
                        return SizedBox(
                            width: boxWidth,
                            height: 180,
                            child:
                                ImageContainer(imageDTO: event.images[index]));
                      }
                      return Container(
                        height: 180,
                        width: boxWidth,
                        margin: EdgeInsets.only(right: 5),
                        child: ImageContainer(imageDTO: event.images[index]),
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

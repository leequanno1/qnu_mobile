import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/event_controller.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/routes/route_name.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    EventController controller = Get.find();
    controller.loadEvent();
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: Obx(() => ListView.builder(
        itemCount: controller.events.length,
        itemBuilder: (context, index) {
          return _PublicEventItem(event: controller.events[index],controller: controller);
        },
      ),),
    );
  }
}

class _PublicEventItem extends StatelessWidget {
  final Event event;
  final EventController controller;

  const _PublicEventItem({required this.event, required this.controller});

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
                          event.eventDto.orgId);
                      Get.toNamed(RouteNames.org);
                    },
                    child: Text(
                      controller.orgs[event.eventDto.orgId]!.orgName,
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
                            HttpUtil.mapUrl(event.memberInfo.userAvatar),
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
                          Text(event.memberInfo.displayName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(DateTimeFormat.toDateTime(event.eventDto.insDate),
                              style: TextStyle(color: Colors.black))
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 40,
                        width: 95,
                        child: ElevatedButton(
                            onPressed: event.eventDto.begin.isBefore(DateTime.now())?null:(){},
                            style: borderButtonEnable,
                            child: event.eventDto.join
                                ? Text("Đã đăng ký", style: TextStyle(fontSize: 12),)
                                : Text("Đăng ký", style: TextStyle(fontSize: 12),)),
                      )
                    ],
                  )
                ],
              ),
              // time
              Row(
                children: [
                  Text(DateTimeFormat.toDateTime(event.eventDto.begin), style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 30, height: 10,),
                  Text(DateTimeFormat.toDateTime(event.eventDto.end), style: TextStyle(color: AppColors.textRed, fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
              // text
              Text(event.eventDto.eventName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(event.eventDto.eventDescription,
                  style: TextStyle(color: Colors.black)),
              // images
              if (event.eventDto.images.isNotEmpty)
                Container(
                  height: 180,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: event.eventDto.images.length,
                    itemBuilder: (context, index) {
                      double boxWidth = MediaQuery.of(context).size.width - 43;
                      if (event.eventDto.images.length > 2) {
                        boxWidth = 135;
                      } else if (event.eventDto.images.length > 1) {
                        boxWidth = (boxWidth - 10) / 2;
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: SizedBox(
                              width: boxWidth,
                              height: 190,
                              child:
                                  ImageContainer(imageDTO: event.eventDto.images[index])),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Container(
                          height: 190,
                          width: boxWidth,
                          margin: EdgeInsets.only(right: 5),
                          child: ImageContainer(imageDTO: event.eventDto.images[index]),
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

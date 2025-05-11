import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/models/event.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/presentation/wigets/image_container.dart';
import 'package:qnu_mobile/utils/date_time_format.dart';

class PrivateEventView extends StatelessWidget {
  final Event eventItem;
  final bool forApproved;
  const PrivateEventView({super.key, required this.eventItem, this.forApproved = false});

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
                        borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eventItem.memberInfo.displayName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      Text(DateTimeFormat.toDateTime(eventItem.eventDto.insDate),
                          style: TextStyle(color: Colors.black))
                    ],
                  ),
                  Spacer(),
                  if(!forApproved)
                    SizedBox(
                      height: 45,
                      width: 140,
                      child: ElevatedButton(
                          onPressed: eventItem.eventDto.begin.isBefore(DateTime.now())?null:(){},
                          style: borderButtonEnable,
                          child: eventItem.eventDto.join
                              ? Text("Đã đăng ký")
                              : Text("Đăng ký")),
                    )
                ],
              ),
              // time
              Row(
                children: [
                  Text(DateTimeFormat.toDateTime(eventItem.eventDto.begin), style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 30, height: 10,),
                  Text(DateTimeFormat.toDateTime(eventItem.eventDto.end), style: TextStyle(color: AppColors.textRed, fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
              // text
              Text(eventItem.eventDto.eventName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(eventItem.eventDto.eventDescription,
                  style: TextStyle(color: Colors.black)),
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
                        return SizedBox(
                            width: boxWidth,
                            height: 180,
                            child:
                                ImageContainer(imageDTO: eventItem.eventDto.images[index]));
                      }
                      return Container(
                        height: 180,
                        width: boxWidth,
                        margin: EdgeInsets.only(right: 5),
                        child: ImageContainer(imageDTO: eventItem.eventDto.images[index]),
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
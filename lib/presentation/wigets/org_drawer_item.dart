import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/routes/route_name.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class OrgDrawerItem extends StatelessWidget {
  final Org org;
  const OrgDrawerItem({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<OrgController>().setSelectedOrg(org.orgId);
        Get.toNamed(RouteNames.org);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 7.5, right: 2),
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22.5),
                child: Image.network(
                  HttpUtil.mapUrl(org.orgAvatar),
                  height: 45,
                  width: 45,
                  errorBuilder: (context, error, stackTrace) => Container(width: 45, height: 45, decoration: BoxDecoration(color: AppColors.outline),), 
                  fit: BoxFit.cover,),
              ),
              SizedBox(width: 10,),
              Text(org.orgName, style: TextStyle(color: AppColors.darkSurface, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
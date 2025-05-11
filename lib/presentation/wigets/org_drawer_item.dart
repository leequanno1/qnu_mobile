import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/routes/route_name.dart';

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
              CircleAvatar(
                radius: 22.5,
                backgroundColor: AppColors.primary,
                foregroundImage: AssetImage(org.orgAvatar),
                onForegroundImageError: (exception, stackTrace) {
                },
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
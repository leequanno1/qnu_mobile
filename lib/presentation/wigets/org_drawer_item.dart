import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/models/org.dart';

class OrgDrawerItem extends StatelessWidget {
  final Org org;
  const OrgDrawerItem({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7.5, right: 2),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
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
    );
  }
}
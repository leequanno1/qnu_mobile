import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/presentation/wigets/org_drawer_item.dart';

class DrawerWidget{
  static Drawer getDrawer() {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 20),
              child: const Text("Danh sách tổ chức", style: TextStyle(
                fontSize: 20,
                color: AppColors.darkSurface
              ),),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.outline),
                ),
                child: ListView(
                  padding: EdgeInsets.only(top: 7.5),
                  children: [
                    OrgDrawerItem(org: Org(orgId: "orgId", orgName: "orgName", orgDescription: "orgDescription", orgAvatar: "orgAvatar", orgBackground: "orgBackground", members: 10, posts: 10, events: 10, insDate: DateTime.now(), delFlg: false)),
                    OrgDrawerItem(org: Org(orgId: "orgId", orgName: "orgName", orgDescription: "orgDescription", orgAvatar: "orgAvatar", orgBackground: "orgBackground", members: 10, posts: 10, events: 10, insDate: DateTime.now(), delFlg: false)),
                    OrgDrawerItem(org: Org(orgId: "orgId", orgName: "orgName", orgDescription: "orgDescription", orgAvatar: "orgAvatar", orgBackground: "orgBackground", members: 10, posts: 10, events: 10, insDate: DateTime.now(), delFlg: false)),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


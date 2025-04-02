import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';

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
                  children: [],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  
}
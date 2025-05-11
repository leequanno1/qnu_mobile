import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';

class ProfileAppbar {
  static AppBar getAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.black54),
      centerTitle: false,
      shape: Border(bottom: BorderSide(color: AppColors.outline)),
      title: Text("Thông tin cá nhân",style: TextStyle(color: Colors.black),),
      elevation: 2,
      shadowColor: Colors.black54,
      surfaceTintColor: Colors.transparent,
      actions: [
          PopupMenuButton(
            icon: Icon(PhosphorIconsBold.dotsThreeVertical, color: AppColors.darkBackground,),
            itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text("Chỉnh sửa", style: TextStyle(color: AppColors.darkBackground),)),
              PopupMenuItem(child: Text("Đổi mật khẩu", style: TextStyle(color: AppColors.darkBackground),))
            ];
          })
        ],
    );
  }
}
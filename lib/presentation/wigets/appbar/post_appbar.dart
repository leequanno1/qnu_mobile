import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';

class PostAppbar {
  static AppBar getAppBar(){
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black54),
      centerTitle: false,
      shape: Border(bottom: BorderSide(color: AppColors.outline)),
      title: Text("Bài đăng",style: TextStyle(color: Colors.black),),
      elevation: 2,
      shadowColor: Colors.black54,
      surfaceTintColor: Colors.transparent
    );
  }
}
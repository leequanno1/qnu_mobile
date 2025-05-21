import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main/event_controller.dart';
import 'package:qnu_mobile/controller/main/post_controller.dart';
import 'package:qnu_mobile/presentation/views/main/event_view.dart';
import 'package:qnu_mobile/presentation/views/main/post_view.dart';
import 'package:qnu_mobile/presentation/views/main/profile_view.dart';
import 'package:qnu_mobile/presentation/wigets/appbar/event_appbar.dart';
import 'package:qnu_mobile/presentation/wigets/appbar/post_appbar.dart';
import 'package:qnu_mobile/presentation/wigets/appbar/profile_appbar.dart';
import 'package:qnu_mobile/presentation/wigets/drawer_widget.dart';

class MainLayoutController extends GetxController {



  final List<Widget> screens = [
    // Post
    const PostView(),
    // Event
    const EventView(),
    // Profile
    ProfileView(),
  ];

  T findOrPut<T extends GetxController>(T Function() creator) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    return Get.put<T>(creator());
  }
}

  // final List<AppBar> appBars = [
  //   // Post
  //   PostAppbar.getAppBar(),
  //   // Event
  //   EventAppbar.getAppBar(),
  //   // Profile
  //   ProfileAppbar.getAppBar(),
  // ];

  AppBar getAppBar(BuildContext context, index) {
    switch (index) {
      case 0:
        return PostAppbar.getAppBar();
      case 1:
        return EventAppbar.getAppBar();
      case 2: 
        return ProfileAppbar.getAppBar(context);
    }
    return AppBar();
  }

  final List<Widget?> drawers = [
    DrawerWidget.getDrawer(),
    DrawerWidget.getDrawer(),
    null
  ];

  var selectedIndex = 0.obs;

  void changeScreen(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        // reload Post
        Get.find<PostController>().loadPost();
        break;
      case 1:
        // reload Event
        findOrPut<EventController>(()=>EventController()).loadEvent();
        break;
    }
  }
}
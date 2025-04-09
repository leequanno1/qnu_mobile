import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    const ProfileView(),
  ];

  final List<AppBar> appBars = [
    // Post
    PostAppbar.getAppBar(),
    // Event
    EventAppbar.getAppBar(),
    // Profile
    ProfileAppbar.getAppBar(),
  ];

  final List<Widget?> drawers = [
    DrawerWidget.getDrawer(),
    DrawerWidget.getDrawer(),
    null
  ];

  var selectedIndex = 0.obs;

  void changeScreen(int index) {
    selectedIndex.value = index;
  }
}
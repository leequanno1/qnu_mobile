import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayoutController extends GetxController {

  final List<Widget> screens = [
  ];

  var selectedIndex = 0.obs;

  void changeScreen(int index) {
    selectedIndex.value = index;
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOverlayController extends GetxController {
  late PageController pageController;
  final currentIndex = 0.obs;

  void init(int initialIndex) {
    pageController = PageController(initialPage: initialIndex);
    currentIndex.value = initialIndex;
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

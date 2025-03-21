import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main_layout_controller.dart';
import 'package:qnu_mobile/presentation/wigets/custom_bottom_bar.dart';

class MainLayout extends GetView<MainLayoutController> {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainLayoutController());
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Container(
              color: const Color(0xFFF2F4F7),
              // add screens to visible view
              child: controller.screens[controller.selectedIndex.value],
            )),
      ),
      extendBody: true,
      bottomNavigationBar: Obx(() => CustomBottomBar(
            selectedIndex: controller.selectedIndex.value,
            onItemTapped: (index) {
              controller.changeScreen(index);
            },
          )),
    );
  }
}
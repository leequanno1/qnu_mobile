import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/main_layout_controller.dart';
import 'package:qnu_mobile/presentation/wigets/custom_bottom_bar.dart';

class MainLayout extends GetView<MainLayoutController> {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainLayoutController());
    return Obx(() => Scaffold(
          drawer: controller.drawers[controller.selectedIndex.value],
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black54),
              centerTitle: false,
              shape: Border(bottom: BorderSide(color: AppColors.outline)),
              title: controller.appBars[controller.selectedIndex.value],
              elevation: 2,
              shadowColor: Colors.black54,
              surfaceTintColor: Colors.transparent),
          body: SafeArea(
            child: Obx(() => Container(
                  color: const Color(0xFFF2F4F7),
                  // add screens to visible view
                  child: controller.screens[controller.selectedIndex.value],
                )),
          ),
          extendBody: true,
          bottomNavigationBar: CustomBottomBar(
                selectedIndex: controller.selectedIndex.value,
                onItemTapped: (index) {
                  controller.changeScreen(index);
                },
              ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/image_overlay_controller.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ImageOverlayViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  ImageOverlayViewer({super.key, required this.images, required this.initialIndex}) {
    final controller = Get.put(ImageOverlayController());
    controller.init(initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ImageOverlayController>();

    return Material(
      color: Colors.black.withOpacity(0.9),
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: images.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (_, index) => Center(
              child: InteractiveViewer(
                child: Image.network(HttpUtil.mapUrl(images[index])),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, size: 30, color: Colors.white),
              onPressed: () {
                Get.back(); // Đóng dialog
              },
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Obx(() => Center(
              child: Text(
                "${controller.currentIndex.value + 1} / ${images.length}",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )),
          ),
        ],
      ),
    );
  }
}

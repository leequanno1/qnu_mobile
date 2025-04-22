import 'package:get/get.dart';
import 'package:qnu_mobile/controller/org/content_moderation_controller.dart';

class ContentModerationBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContentModerationController());
  }
}
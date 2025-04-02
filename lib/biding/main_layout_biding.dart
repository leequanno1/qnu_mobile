import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main/event_controller.dart';
import 'package:qnu_mobile/controller/main/post_controller.dart';
import 'package:qnu_mobile/controller/main/profile_controller.dart';

class MainLayoutBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
    Get.lazyPut(() => EventController());
    Get.lazyPut(() => ProfileController());
  }
}
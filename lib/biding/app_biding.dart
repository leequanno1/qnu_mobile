import 'package:get/get.dart';
import 'package:qnu_mobile/data/services/state_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StateService());
  }
}
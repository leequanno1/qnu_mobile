import 'package:get/get.dart';
import 'package:qnu_mobile/controller/authent/active_account_controller.dart';

class ActiveAccountBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveAccountController());
  }
  
}
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/authent/forgot_pass_controller.dart';

class ForgotPassBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ForgotPassController());
  }
  
}
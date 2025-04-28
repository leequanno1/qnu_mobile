import 'package:get/get.dart';
import 'package:qnu_mobile/controller/authent/authent_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthentController());
  }
  
}
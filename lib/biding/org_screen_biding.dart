import 'package:get/get.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/data/repository/org_repository.dart';

class OrgScreenBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrgController());
    Get.lazyPut(() => OrgRepository());
  }

}
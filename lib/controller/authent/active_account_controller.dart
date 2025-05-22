import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ActiveAccountController extends GetxController {
  final StateService stateService = Get.find();
  TextEditingController codeController = TextEditingController();
  RxString displayName = "".obs;
  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();
    displayName.value = stateService.userInfo.value!.displayName;
  }

  Future<bool> onSubmit() async {
    if (codeController.text.isEmpty) {
      message.value = "Vui lòng nhập mã xác thực";
      return false;
    } else {
      try {
        var headerPair = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': stateService.getToken()
        };
        await HttpUtil.post("/api/validation/active_account",
            body: {"validationCode": codeController.text.trim()},
            headers: headerPair);
        return true;
      } catch (e) {
        message.value = "Mã xác kích hoạt không chính xác";
        return false;
      }
    }
  }

  Future<void> onSendCode() async {
    try {
      var headerPair = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': stateService.getToken()
        };
      await HttpUtil.post(
        "/api/validation/send-active-code", body: {}, headers: headerPair
      );
    } catch (e) { 
      print(e);
    }
  }
}

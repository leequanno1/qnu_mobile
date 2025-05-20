import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'package:qnu_mobile/utils/toast_ultil.dart';

class ChangePassController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController repeatPassController = TextEditingController();
  final StateService stateService = Get.find();
  final RxString message = "".obs;

  Future<void> sendCode() async {
    // check if mail is empty?
    if (emailController.text.isEmpty) {
      ToastUltil.showToast("Bạn chưa nhập email");
    } else {
      _handelSendCode(emailController.text);
    }
  }

  Future<void> _handelSendCode(String email) async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    try {
      await HttpUtil.post("/api/validation/send_email",
          body: {"email": email.trim()}, headers: headerPair);
      ToastUltil.showToast("Gửi thành công");
    } catch (e) {
      ToastUltil.showToast("Mail lỗi");
    }
  }

  Future<void> onSubmit() async {
    if (codeController.text.isEmpty) {
      message.value = "Chưa nhập mã xác thực";
      return;
    } else if (passController.text.isEmpty) {
      message.value = "Chưa nhập mật khẩu mới";
      return;
    } else if (passController.text != repeatPassController.text) {
      message.value = "Nhập lại mật khẩu không khớp";
      return;
    }
    try {
      var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
      await HttpUtil.post("/api/validation/change_password", body: {
      "userId": stateService.userInfo.value?.userId,
      "validationCode": codeController.text.trim(),
      "newPassword": passController.text.trim(),
      "repeatPassword": passController.text.trim(),
    },
    headers: headerPair);
      ToastUltil.showToast("Đổi mật khẩu thành công");
      Get.back();
    } catch (e) {
      ToastUltil.showToast("Lỗi");
    }
  }

  void clearInput(){
    emailController.clear();
    passController.clear();
    codeController.clear();
    repeatPassController.clear();
  }
}

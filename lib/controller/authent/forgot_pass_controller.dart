import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'package:qnu_mobile/utils/toast_ultil.dart';

class ForgotPassController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();
  final RxString message = "".obs;

  Future<void> sendCode() async {
    if (usernameController.text.isEmpty) {
      ToastUltil.showToast("Xin nhập tài khoản");
    } else {
      try {
        await HttpUtil.post("/api/validation/send-forget-password-code",
            body: {"userId": usernameController.text.trim()});
        ToastUltil.showToast("Đã gửi thành công");
      } catch (e) {
        ToastUltil.showToast("Lỗi! Vui lòng thử lại");
      }
    }
  }

  Future<bool> onSubmit() async {
    if (usernameController.text.isEmpty) {
      message.value = "Xin hãy nhập tài khoản";
    } else if (codeController.text.isEmpty) {
      message.value = "Xin hãy nhập mã xác thực";
    } else if (passwordController.text.isEmpty) {
      message.value = "Xin hãy nhập mật khẩu mới";
    } else if (passwordController.text != repeatPassController.text) {
      message.value = "Nhập lại mật khẩu không khớp";
    } else {
      try {
        await HttpUtil.post("/api/validation/change_forgot_password", body: {
          "userId": usernameController.text.trim(),
          "validationCode": codeController.text.trim(),
          "newPassword": passwordController.text.trim(),
          "repeatPassword": passwordController.text.trim()
        });
        ToastUltil.showToast("Đổi mật khẩu thành công");
        return true;
      } catch (e) {
        ToastUltil.showToast("Lỗi! Vui lòng thử lại.");
        return false;
      }
    }
    return false;
  }
}

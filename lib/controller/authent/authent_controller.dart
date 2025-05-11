import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/token.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/routes/route_name.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class AuthentController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> onSubmit() async {
    try {
      CustomResponse<Token> response = CustomResponse.convert(await HttpUtil.post(
        "/api/v1/auth/authenticate",
        body: {
          "userId": usernameController.text.trim(),
          "password": passwordController.text.trim()
        },
      ), (json) => Token.fromJson(json));
      print(response.data.token);
      Get.find<StateService>().setAuthenticated(true,response.data.token);
      await Get.put(OrgController()).loadOrgList("4451190096");
      Get.toNamed(RouteNames.splash);
    } catch (e) {
      print(e);
    }
  }
}

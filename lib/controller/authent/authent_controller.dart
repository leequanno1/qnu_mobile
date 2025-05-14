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
  StateService stateService = Get.find<StateService>();

  Future<void> onSubmit() async {
    try {
      CustomResponse<Token> response = CustomResponse.convert(
          await HttpUtil.post(
            "/api/v1/auth/authenticate",
            body: {
              "userId": usernameController.text.trim(),
              "password": passwordController.text.trim()
            },
          ),
          (json) => Token.fromJson(json));
      print(response.data.token);
      await stateService.setAuthenticated(true, response.data.token);
      await Get.put(OrgController()).loadOrgList();
      Get.offNamed(RouteNames.splash);
    } catch (e) {
      print(e);
    }
  }

  void checkAuthStatus() async {
    // if (stateService.getToken().isNotEmpty) {
    //   try {
    //     var headerPair = {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //       'Authorization': stateService.getToken()
    //     };
    //     dynamic rawResponse = await HttpUtil.post("/api/v1/auth/validate",
    //         body: {"bearerToken": stateService.token}, headers: headerPair);
    //     print("1111111 $rawResponse");
    //     Get.offNamed(RouteNames.splash);
    //   } catch (e) {
    //     print("Exprited");
    //   }
    // } else {
    //   print("null token");
    // }
  }
}

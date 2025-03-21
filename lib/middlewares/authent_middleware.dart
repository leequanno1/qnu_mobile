import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final stateService = Get.find<StateService>();
    final publicRoutes = [RouteNames.login];
    
    if (publicRoutes.contains(route)) {
      return null;
    }

    if (!stateService.isAuthenticated) {
      return const RouteSettings(name: RouteNames.login);
    }
    return null;
  }
}
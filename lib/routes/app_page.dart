import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:qnu_mobile/middlewares/authent_middleware.dart';
import 'package:qnu_mobile/presentation/views/main_layout.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class AppPages {
  static final routes = [
    //Protect route
    GetPage(
      name: RouteNames.splash,
      page: () => const MainLayout(),
      middlewares: [AuthMiddleware()],
    ),

  ];
}
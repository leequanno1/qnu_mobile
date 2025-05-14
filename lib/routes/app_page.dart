import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:qnu_mobile/biding/content_moderation_biding.dart';
import 'package:qnu_mobile/biding/forgot_pass_biding.dart';
import 'package:qnu_mobile/biding/login_biding.dart';
import 'package:qnu_mobile/biding/main_layout_biding.dart';
import 'package:qnu_mobile/biding/org_screen_biding.dart';
import 'package:qnu_mobile/middlewares/authent_middleware.dart';
import 'package:qnu_mobile/presentation/views/forget_pass/forget_pass_view.dart';
import 'package:qnu_mobile/presentation/views/login/login_view.dart';
import 'package:qnu_mobile/presentation/views/main/main_layout.dart';
import 'package:qnu_mobile/presentation/views/org/content_moderation_screen.dart';
import 'package:qnu_mobile/presentation/views/org/org_screen.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class AppPages {
  static final routes = [
    //Protect route
    GetPage(
      name: RouteNames.splash,
      page: () => const MainLayout(),
      binding: MainLayoutBiding(),
      middlewares: [AuthMiddleware()],
    ),

    // Group route
    GetPage(
      name: RouteNames.org,
      page: () => const OrgScreen(),
      binding: OrgScreenBiding(),
    ),

    // content moderation
    GetPage(
      name: RouteNames.contentModeration, 
      page: () => ContentModerationScreen(),
      binding: ContentModerationBiding(),
    ),

    GetPage(
      name: RouteNames.login, 
      page: () => LoginView(),
      binding: LoginBiding(),
    ),

    GetPage(
      name: RouteNames.forgotPassword, 
      page: () => const ForgetPassView(),
      binding: ForgotPassBiding(),
    ),
    
  ];
}
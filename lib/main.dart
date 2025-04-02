import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_theme.dart';
import 'package:qnu_mobile/biding/app_biding.dart';
import 'package:qnu_mobile/routes/app_page.dart';
import 'package:qnu_mobile/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ORG',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // home: const MainLayout(),
      initialRoute: RouteNames.splash,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      localizationsDelegates: const [
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
    );
  }
}
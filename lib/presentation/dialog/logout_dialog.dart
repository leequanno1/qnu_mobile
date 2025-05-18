import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/main_layout_controller.dart';
import 'package:qnu_mobile/controller/main/profile_controller.dart';
import 'package:qnu_mobile/presentation/dialog/custom_diaglog.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class LogoutDialog implements CustomDiaglog {
  static LogoutDialog instance =  LogoutDialog();

  @override
  void render(BuildContext context, GetxController? controller) {
    showDialog(
      context: context, 
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.lightBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox( width: double.maxFinite, child: Text("Bạn muốn đăng xuất?", style: TextStyle(color: Colors.black, fontSize: 18),)),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10,
                  children: [
                    SizedBox(width: 110, child: ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, style: buttonSecondary, child: Text("Hủy", style: TextStyle(fontWeight: FontWeight.normal),))),
                    SizedBox(width: 120, child: ElevatedButton(onPressed: () async {
                      Get.offNamed(RouteNames.login);
                      Get.find<MainLayoutController>().changeScreen(0);
                      Get.delete<ProfileController>();
                    }, style: redBackgroundButton, child: Text("Đăng xuất", style: TextStyle(fontWeight: FontWeight.normal),))),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  
}
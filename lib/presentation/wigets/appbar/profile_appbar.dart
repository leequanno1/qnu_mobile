import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/presentation/views/main/change_password_view.dart';

class ProfileAppbar {
  static AppBar getAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.black54),
      centerTitle: false,
      shape: Border(bottom: BorderSide(color: AppColors.outline)),
      title: Text(
        "Thông tin cá nhân",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 2,
      shadowColor: Colors.black54,
      surfaceTintColor: Colors.transparent,
      actions: [
        PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case 0:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Full height
                    builder: (context) => ChangePasswordView(),
                  );
                  break;
                default:
              }
            },
            icon: Icon(
              PhosphorIconsBold.dotsThreeVertical,
              color: AppColors.darkBackground,
            ),
            itemBuilder: (context) {
              return [
                // PopupMenuItem(child: Text("Chỉnh sửa", style: TextStyle(color: AppColors.darkBackground),)),
                PopupMenuItem(
                    value: 0,
                    child: Text(
                      "Đổi mật khẩu",
                      style: TextStyle(color: AppColors.darkBackground),
                    ))
              ];
            })
      ],
    );
  }
}

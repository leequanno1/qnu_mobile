import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/logo.webp'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                //TK
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      labelText: 'Tài khoản',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30), // 👈 Bo góc 10 khi chưa focus
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30), // 👈 Bo góc 10 khi focus
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                //MXT
                Stack(children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Mã xác thực',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              30), // 👈 Bo góc 10 khi chưa focus
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              30), // 👈 Bo góc 10 khi focus
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: buttonGreen,
                          child: Row(
                            children: [
                              Icon(
                                PhosphorIconsBold.paperPlaneTilt,
                                color: Colors.white,
                              ),
                              Text("(10)")
                            ],
                          )),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                // MKM
                TextFormField(
                  obscureText:true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      labelText: 'Mật khẩu mới',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30), // 👈 Bo góc 10 khi chưa focus
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30), // 👈 Bo góc 10 khi focus
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                // CF MKM
                TextFormField(
                  obscureText:true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      labelText: 'Nhập lại mật khẩu mới',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30), // 👈 Bo góc 10 khi chưa focus
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30), // 👈 Bo góc 10 khi focus
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tài khoản hoặc mật khẩu không chính xác.",
                  style: TextStyle(color: AppColors.error),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: buttonPrimary,
                        child: Text("Đặt lại mật khẩu"))),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

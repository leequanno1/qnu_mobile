import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/authent/authent_controller.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthentController auController = Get.find<AuthentController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/logo.webp'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 30,),
                const Text("Đăng nhập", style: TextStyle(color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: auController.usernameController,
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
                const SizedBox(height: 20,),
                TextFormField(
                  obscureText:true,
                  controller: auController.passwordController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      labelText: 'Mật khẩu',
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
                const SizedBox(height: 10,),
                const Text("Tài khoản hoặc mật khẩu không chính xác.", style: TextStyle(color: AppColors.error),),
                const SizedBox(height: 15,),
                SizedBox(width: double.maxFinite, height: 50, child: ElevatedButton(onPressed: () {auController.onSubmit();}, style: buttonPrimary, child: Text("Đăng nhập"))),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteNames.forgotPassword),
                  child: Text("Quên mật khẩu?", style: TextStyle(color: AppColors.primary, fontSize: 16, ),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
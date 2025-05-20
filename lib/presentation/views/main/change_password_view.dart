import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/change_pass_controller.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  final ChangePassController _controller = Get.put(ChangePassController());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: .9,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppColors.outline),
                centerTitle: false,
                shape: Border(bottom: BorderSide(color: AppColors.outline)),
                leading: IconButton(
                    onPressed: () {
                      _controller.clearInput();
                      Get.back();
                    },
                    icon: Icon(
                      PhosphorIconsBold.caretLeft,
                      color: AppColors.primary,
                    )),
                title: Text(
                  "Đổi mật khẩu",
                  style: TextStyle(color: Colors.black),
                ),
                elevation: 2,
                shadowColor: Colors.black54,
                surfaceTintColor: Colors.transparent
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _controller.emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: 'Mail xác thực',
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
                        controller: _controller.codeController,
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
                              onPressed: () {
                                _controller.sendCode();
                              },
                              style: buttonGreen,
                              child: Row(
                                children: [
                                  Icon(
                                    PhosphorIconsBold.paperPlaneTilt,
                                    color: Colors.white,
                                  ),
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
                      controller: _controller.passController,
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
                      controller: _controller.repeatPassController,
                      obscureText:true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: 'Nhập lại mật khẩu mới',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                30),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                          ),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => Text(_controller.message.value, style: TextStyle(color: AppColors.textRed),),),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(onPressed: () async {
                        await _controller.onSubmit();
                      }, style: buttonPrimary, child: Text("Đổi mật khẩu")))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
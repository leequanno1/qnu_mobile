import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/authent/active_account_controller.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/routes/route_name.dart';

class ActiveAccountView extends StatelessWidget {
  ActiveAccountView({super.key});
  final ActiveAccountController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 81,
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage:
                        AssetImage("assets/images/blank_profile.jpg"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Chào ${_controller.displayName}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Tài khoản này chưa được kích hoạt. Vui lòng nhập mã kích hoạt được gửi đến email của bạn để kích hoạt tài khoản.",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
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
                          onPressed: () { _controller.onSendCode(); },
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
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Obx(() => Text(
                    _controller.message.value,
                    style: TextStyle(color: AppColors.textRed),
                  ),),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () async {
                        if(await _controller.onSubmit()){
                          await Get.put(OrgController()).loadOrgList();
                          Get.offNamed(RouteNames.splash);
                        }
                      },
                      style: buttonPrimary,
                      child: Text("Kích hoạt")),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () => Get.back(),
                    child: Text(
                  "Đăng nhập bằng tài khoản khác",
                  style: TextStyle(color: AppColors.primary, fontSize: 16),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

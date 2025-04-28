import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),
                const SizedBox(height: 30,),
                const Text("Đăng nhập", style: TextStyle(color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                TextFormField(
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
                SizedBox(width: double.maxFinite, height: 50, child: ElevatedButton(onPressed: () {}, style: buttonPrimary, child: Text("Đăng nhập"))),
                const SizedBox(height: 10,),
                Text("Quên mật khẩu?", style: TextStyle(color: AppColors.primary, fontSize: 16, ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             CircleAvatar(),
//             const Text("Đăng nhập"),
//             Form(
//                 child: Column(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                         labelText: 'Tài khoản',
//                         labelStyle: TextStyle(color: Colors.black)),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                         labelText: 'Mật khẩu',
//                         labelStyle: TextStyle(color: Colors.black)),
//                   ),
//                 ),
//                 const Text("Tài khoản hoặc mật khẩu không chính xác."),
//                 ElevatedButton(onPressed: () {}, child: Text("Đăng nhập")),
//               ],
//             )),
//             Text("Quên mật khẩu?")
//           ],
//         ),
//       ),
//     );

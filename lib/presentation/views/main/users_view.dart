import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("UsersView", style: TextStyle(
            color: Colors.black
          ),)
        ],
      ),
    );
  }
}
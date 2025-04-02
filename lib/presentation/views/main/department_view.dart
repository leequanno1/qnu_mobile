import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/main/department_controller.dart';

class DepartmentView extends GetView<DepartmentController>{
  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("DepartmentView", style: TextStyle(
            color: Colors.black
          ),)
        ],
      ),
    );
  }
}
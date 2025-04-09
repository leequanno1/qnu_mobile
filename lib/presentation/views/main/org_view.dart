import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';

class OrgView extends GetView<OrgController> {
  const OrgView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("OrgView", style: TextStyle(
            color: Colors.black
          ),)
        ],
      ),
    );
  }
}
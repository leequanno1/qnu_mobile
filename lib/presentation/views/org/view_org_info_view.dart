import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/org_controller.dart';

class ViewOrgInfoView extends StatelessWidget {
  ViewOrgInfoView({super.key});
  final OrgController _controller = Get.find();

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
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    PhosphorIconsBold.caretLeft,
                    color: AppColors.primary,
                  )),
            ),
            body: Column(
              children: [
                // tên nhóm
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        "Tên nhóm: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(_controller.org.orgName,
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                ),
                // mô tả nhóm
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mô tả nhóm: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            _controller.org.orgDescription,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // số lượng thành viên nhóm
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _labelContent("Số lượng thành viên", "${_controller.org.members} thành viên."),
                      GestureDetector(
                        child: Text("See all", style: TextStyle(color: AppColors.primary),),
                      )
                    ],
                  ),
                ),
                // số lượng bài viết
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: _labelContent("Số lượng bài viết", "${_controller.org.posts} bài viết."),
                ),
                // số lượng sự kiện
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: _labelContent("Số lượng sự kiện", "${_controller.org.events} sự kiện."),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _labelContent(String lable, String content) {
  return Row(
    children: [
      Text(
        "$lable: ",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Text(content, style: TextStyle(color: Colors.black, fontSize: 18)),
    ],
  );
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/org/change_group_info_controller.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';

class ChangeGroupInfoView extends StatelessWidget {
  const ChangeGroupInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeGroupInfoController controller = Get.put(ChangeGroupInfoController());
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: .9,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black54),
                centerTitle: false,
                shape: Border(bottom: BorderSide(color: AppColors.outline)),
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      PhosphorIconsBold.caretLeft,
                      color: AppColors.primary,
                    )),
                title: Text(
                  "Tạo bài viết",
                  style: TextStyle(color: Colors.black),
                ),
                elevation: 2,
                shadowColor: Colors.black54,
                surfaceTintColor: Colors.transparent),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // background
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        await controller.changeBackground();
                      },
                      child: Container(
                        height: 150,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.outline, width: 1),
                        ),
                        child:
                            _renderImage(controller.backgroundImg.value.first),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // group
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      // avt
                      GestureDetector(
                        onTap: () async {
                          await controller.changeAvt();
                        },
                        child: Obx(() => CircleAvatar(
                          radius: 50,
                          backgroundImage: _avtRender(controller.avtImg.value.first),
                        ),),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.nameController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: 'Tên nhóm',
                                  labelStyle: TextStyle(color: Colors.black)),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Nhóm mới'
                                      : null,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: controller.descriptionController,
                              style: TextStyle(color: Colors.black),
                              minLines: 5,
                              maxLines: 100,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Mô tả nhóm',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                            SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  onPressed: () => controller.submit(),
                                  style: buttonPrimary,
                                  child: Text("Lưu thay đổi"),
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _renderImage(File? file) {
  if (file == null) {
    return SizedBox.shrink();
  } else {
    return Image.file(file, width: double.maxFinite,fit: BoxFit.cover,);
  }
}

FileImage? _avtRender(File? file){
  if(file == null){
    return null;
  } else {
    return FileImage(file);
  }
}

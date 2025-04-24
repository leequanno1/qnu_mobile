import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/image_picker_controller.dart';
import 'package:qnu_mobile/controller/org/create_event_controller.dart';
import 'package:qnu_mobile/models/org.dart';

class CreateEventView extends StatelessWidget {
  final Org org;
  const CreateEventView({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
    final ImagePickerController imgController =
        Get.put(ImagePickerController());
    CreateEventController controller = Get.put(CreateEventController());
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: .9,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Scaffold(
            appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black54),
                centerTitle: false,
                shape: Border(bottom: BorderSide(color: AppColors.outline)),
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                      imgController.clearImages();
                      controller.inputReset();
                    },
                    icon: Icon(
                      PhosphorIconsBold.caretLeft,
                      color: AppColors.primary,
                    )),
                title: Text(
                  "Tạo sự kiện",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.submitForm();
                        },
                        child: Text("Đăng")),
                  )
                ],
                elevation: 2,
                shadowColor: Colors.black54,
                surfaceTintColor: Colors.transparent),
            body: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: controller.titleController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: 'Tên sự kiện',
                          labelStyle: TextStyle(color: Colors.black)),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Sự kiện mới' : null,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      controller: controller.contentController,
                      minLines: 10,
                      maxLines: 100,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          labelText: 'Nội dung sự kiện',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(color: Colors.black)),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Sự kiện mới' : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () {
                      final images = imgController.pickedImages;
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border:
                                Border.all(color: AppColors.outline, width: 1)),
                        child: images.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                        color: const Color.fromARGB(
                                            255, 163, 173, 187),
                                      ),
                                      child: Icon(
                                        PhosphorIconsBold.image,
                                        size: 60,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      )),
                                ],
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            200, // Giới hạn chiều rộng tối đa
                                      ),
                                      child: Image.file(images[index]),
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            imgController.pickImagesFromGallery();
                          },
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  PhosphorIconsBold.images,
                                  color: Colors.white,
                                ),
                                Text("Thêm ảnh")
                              ],
                            ),
                          )),
                    ),
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

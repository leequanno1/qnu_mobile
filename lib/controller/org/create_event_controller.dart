import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/controller/image_picker_controller.dart';

class CreateEventController extends GetxController {

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController titleController = TextEditingController();
  
  final TextEditingController contentController = TextEditingController();

  void submitForm(){
    if (_formKey.currentState!.validate()){
      final ImagePickerController imgController =
        Get.put(ImagePickerController());
      final title = titleController.text;
      final content = contentController.text;
      final images = imgController.pickedImages;
      print("title: ${title}; content: ${content}; images: ${images.length}");
      // TODO: call API
    }
  }

  void inputReset() {
    titleController.text = "";
    contentController.text = "";
  }
}
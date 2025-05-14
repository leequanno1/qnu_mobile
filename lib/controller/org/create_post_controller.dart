import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:qnu_mobile/controller/image_picker_controller.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'package:http/http.dart' as http;

class CreatePostController extends GetxController {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  final StateService stateService = Get.find();

  void submitForm(String memberId) async {
    if (_formKey.currentState!.validate()) {
      final ImagePickerController imgController =
          Get.put(ImagePickerController());
      final title = titleController.text;
      final content = contentController.text;
      await _uploadPost(memberId, title, content, imgController.pickedImages);
    }
  }

  void inputReset() {
    titleController.text = "";
    contentController.text = "";
  }

  _uploadPost(String posterId, String title, String content, List<File> pickedImages) async {
    var headerPair = {
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    List<http.MultipartFile> multipartImages = [];

    for (final file in pickedImages) {
      final bytes = await file.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'images',
        bytes,
        filename: basename(file.path),
        contentType: MediaType('image', 'jpeg'),
      );
      multipartImages.add(multipartFile);
    }

    await HttpUtil.putFormData(
      '/api/post/create',
      fields: {
        'posterId': posterId,
        'postTitle': title,
        'postContent': content,
      },
      files: multipartImages,
      headers: headerPair
    );

  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:qnu_mobile/controller/image_picker_controller.dart';
import 'package:qnu_mobile/controller/org/date_time_picker_controller.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'package:http/http.dart' as http;


class CreateEventController extends GetxController {

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController titleController = TextEditingController();
  
  final TextEditingController contentController = TextEditingController();

  final DateTimePickerController dateController = Get.put(DateTimePickerController());
  
  final StateService stateService = Get.find();

  void submitForm(String memberId) async {
    if (_formKey.currentState!.validate()){
      final ImagePickerController imgController =
        Get.put(ImagePickerController());
      final title = titleController.text;
      final content = contentController.text;
      final start = dateController.startTime.value;
      final end = dateController.endTime.value;
      final images = imgController.pickedImages;
      try {
        await _uploadEvent(memberId, title, content, start!, end!, images);
        inputReset();
        imgController.clearImages();
        Get.back();
      } catch (e) { }
    }
  }

  void inputReset() {
    titleController.text = "";
    contentController.text = "";
    dateController.dataReset();
  }

  _uploadEvent(String hosterId, String title, String content, DateTime start, DateTime end ,List<File> pickedImages) async {
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
      '/api/event/create',
      fields: {
        'hosterId': hosterId,
        'eventName': title,
        'eventDescription': content,
        'begin': formatDate(start),
        'end': formatDate(end)
      },
      files: multipartImages,
      headers: headerPair
    );

  }

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    return formatter.format(dateTime.toUtc());
  }
}
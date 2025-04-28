import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/utils/image_picker_util.dart';
import 'package:qnu_mobile/utils/pair.dart';

class ChangeGroupInfoController extends GetxController {
  late Org org;
  final Rx<Pair<File?,bool>> avtImg = Rx(Pair(null, false));
  final Rx<Pair<File?,bool>> backgroundImg = Rx(Pair(null, false));

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // submit
  void submit(){
    if(avtImg.value.second) {
      print("send avt ${avtImg.value.first}");
    }
    if(backgroundImg.value.second) {
      print("send background ${backgroundImg.value.first}");
    }
    print(nameController.text);
    print(descriptionController.text);
  }

  // change avt
  Future<void> changeAvt() async {
    // mở thư viện
    var xfile = await ImagePickerUtil.pickSingleImage();
    // lưu ảnh và sửa trạng thái
    if(xfile != null) {
      avtImg.value = Pair(File(xfile.path), true);
    }
  }
  
  // change background
  Future<void> changeBackground() async {
    var xfile = await ImagePickerUtil.pickSingleImage();
    // lưu ảnh và sửa trạng thái
    if(xfile != null) {
      backgroundImg.value = Pair(File(xfile.path), true);
    }
  }
}
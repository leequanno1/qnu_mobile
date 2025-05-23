import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/models/org.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'package:qnu_mobile/utils/image_picker_util.dart';
import 'package:qnu_mobile/utils/pair.dart';
import 'package:http/http.dart' as http;

class ChangeGroupInfoController extends GetxController {
  late Org org;
  final Rx<Pair<File?,bool>> avtImg = Rx(Pair(null, false));
  final Rx<Pair<File?,bool>> backgroundImg = Rx(Pair(null, false));
  final StateService stateService = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ChangeGroupInfoController() {
    print('Init controller: ${hashCode}');
  }
  // submit
  Future<void> submit() async {
    if(avtImg.value.second) {
      await _sendAvt(avtImg.value.first!);
    }
    if(backgroundImg.value.second) {
      await _sendBackground(backgroundImg.value.first!);
    }
    await _sendText(nameController.text.trim(), descriptionController.text.trim());
  }

  void _setTextForInputController(){
    nameController.text = org.orgName;
    descriptionController.text = org.orgDescription;
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

  void setOrg(Org org) {
    this.org = org;
    _setTextForInputController();
  }

  Future<void> _sendAvt(File avatar) async {
    var headerPair = {
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    List<http.MultipartFile> multipartImages = [];

    final bytes = await avatar.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'orgAvatar',
        bytes,
        filename: basename(avatar.path),
        contentType: MediaType('image', 'jpeg'),
      );
      multipartImages.add(multipartFile);

    await HttpUtil.putFormData(
      '/api/organization/update',
      fields: {
        'orgId': org.orgId,
      },
      files: multipartImages,
      headers: headerPair
    );
  }

  Future<void> _sendBackground(File background) async {
    var headerPair = {
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    List<http.MultipartFile> multipartImages = [];

    final bytes = await background.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'orgBackGround',
        bytes,
        filename: basename(background.path),
        contentType: MediaType('image', 'jpeg'),
      );
      multipartImages.add(multipartFile);

    await HttpUtil.putFormData(
      '/api/organization/update',
      fields: {
        'orgId': org.orgId,
      },
      files: multipartImages,
      headers: headerPair
    );
  }

  Future<void> _sendText(String name, String des) async {
    var headerPair = {
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };
    await HttpUtil.putFormData(
      '/api/organization/update',
      fields: {
        'orgId': org.orgId,
        'orgName': name,
        'orgDescription': des,
      },
      headers: headerPair
    );
  }
}
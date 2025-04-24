import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final RxList<File> pickedImages = <File>[].obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImagesFromGallery() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      pickedImages.value = pickedFiles.map((xfile) => File(xfile.path)).toList();
    }
  }

  void clearImages() {
    pickedImages.clear();
  }

  void removeImage(File image) {
    pickedImages.remove(image);
  }
}

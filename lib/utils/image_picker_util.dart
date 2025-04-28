import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  // Hàm chọn 1 ảnh
  static Future<XFile?> pickSingleImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      return image;
    } catch (e) {
      print('Error picking single image: $e');
      return null;
    }
  }

  // Hàm chọn nhiều ảnh
  static Future<List<XFile>> pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      return images;
    } catch (e) {
      print('Error picking multiple images: $e');
      return [];
    }
  }
}

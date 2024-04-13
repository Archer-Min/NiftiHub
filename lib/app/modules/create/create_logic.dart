
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'create_state.dart';

class CreateLogic extends GetxController {
  final CreateState state = CreateState();

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      state.upload.value = true;
    }
    state.imageFile = File(pickedFile!.path);
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      state.upload.value = true;
    }
    state.imageFile = File(pickedFile!.path);
  }
}

